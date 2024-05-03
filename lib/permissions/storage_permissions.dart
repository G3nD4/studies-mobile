import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> storagePermission() async {
  final DeviceInfoPlugin info = DeviceInfoPlugin();
  final AndroidDeviceInfo androidInfo = await info.androidInfo;
  debugPrint('releaseVersion : ${androidInfo.version.release}');
  final int androidVersion = int.parse(androidInfo.version.release);
  bool havePermission = false;

  if (androidVersion >= 10) {
    final request = await [
      Permission.videos,
      Permission.photos,
      Permission.audio,
      Permission.manageExternalStorage,
    ].request();

    havePermission =
        request.values.every((status) => status == PermissionStatus.granted);
  } else {
    final request = await [
      Permission.storage,
    ].request();
    havePermission =
        request.values.every((status) => status == PermissionStatus.granted);
  }

  if (!havePermission) {
    // if no permission then open app-setting
    await openAppSettings();
  }

  return havePermission;
}
