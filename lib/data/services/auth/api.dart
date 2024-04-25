import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/models/user_model.dart';

// access token expired -> update it using refresh, user sees nothing
// refresh token expired -> update it by logging in, user has to log in again

const address = '10.0.2.2:8000';

class API {
  static final Dio _api = Dio();
  String? accessToken;

  final _storage = const FlutterSecureStorage();

  API() {
    // this interseptor is needed to refresh access token. It is called in each request to the server,
    // so if one day the access token becomes invalid, the next request will force this interseptor
    // to update the access token using refresh token
    _api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // reading access token from secure storage
          accessToken ??= await _storage.read(key: 'accessToken');

          if (!options.path.contains('http')) {
            options.path =
                'https://$address/${options.path}'; // TODO: rename path
          }
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          // if token has expired
          if (error.response?.statusCode == 422) {
            // if we already have our refresh token in security storage
            if (await _storage.containsKey(key: 'refreshToken')) {
              await refreshToken();
              return handler.resolve(await _retryRequest(error.requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<void> refreshToken() async {
    String? refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      accessToken = null;
      _storage.deleteAll();
    }
    try {
      final Response response = await _api.post(
        '/login',
        data: {
          'value': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        // access token refreshed successfully
        accessToken = response.data['access_token'];
        log('Access token has been refreshed!');
        refreshToken = response.data['refresh_token'];
        await _storage.write(key: 'access_token', value: accessToken);  
        await _storage.write(key: 'refresh_token', value: refreshToken);
      } else {
        // refresh token is invalid
        log('Refresh token has been expired!');
        accessToken = null;
        _storage.deleteAll();
      }
    } catch (e) {
      // TODO: throw user to login screen
      log('Refresh token has been expired!');
      accessToken = null;
      _storage.deleteAll();
    }
  }

  Future<bool> isAuthorized() async {
    return await _storage.read(key: 'access_token') != null;
  }

  Future<dynamic> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> register(RegisterUser registerUser) async {
    try {
      final Response response = await _api.post(
        '${registerUser.userType.name}/',
        data: registerUser.toJson(),
      );
      if (response.statusCode == 200) {
        accessToken = response.data['access_token'];
        await _storage.write(
            key: 'access_token', value: response.data['access_token']);
        await _storage.write(
            key: 'refresh_token', value: response.data['refresh_token']);
        log('Successful registered.');
        log((await _storage.read(key: 'access_token')) as String);
        log((await _storage.read(key: 'refresh_token')) as String);
        return true;
      }
      log(response.toString());
      return false;
    } catch (e) {
      log(e.toString());
      log('Error during registration!', name: 'API register');
      return false;
    }
  }

  // Future<bool> login(AuthUser authUser) async {
  //   try {
  //     final Response response = await _api.post(
  //       '/login/token',
  //       options: Options(
  //         contentType: Headers.formUrlEncodedContentType,
  //       ),
  //       data: authUser.toJson(),
  //     );
  //     if (response.statusCode == 200) {
  //       await _storage.write(
  //           key: 'access_token', value: response.data['access_token']);
  //       await _storage.write(
  //           key: 'refresh_token', value: response.data['refresh_token']);
  //       log((await _storage.read(key: 'access_token')) as String);
  //       log((await _storage.read(key: 'refresh_token')) as String);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Error during logging in!', name: 'API login');
  //     return false;
  //   }
  // }

  // Future<void> getSelf() async {
  //   final Response response = await _api.get('/users/me');
  // }
}
