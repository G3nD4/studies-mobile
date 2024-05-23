import 'package:coursor_tiktok/ui/utils/time_to_string_converter.dart';
import 'package:coursor_tiktok/domain/enums/time_convert_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testForComments();
}

void testForComments() {
  group('Convert time for comments', () {
    test('Seconds ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(seconds: 5)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('5с'));
    });

    test('Minutes ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(minutes: 3)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('3мин'));
    });

    test('Hours ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(hours: 3)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('3ч'));
    });

    test('Days ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(days: 3)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('3д'));
    });

    test('Months ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(days: 76)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('2мес'));
    });

    test('Years ago', () {
      // arrange
      final converter = TimeToStringConverter();

      // act
      final String result = converter.convert(
        DateTime.now().subtract(const Duration(days: 500)),
        TimeConvertType.comment,
      );

      // assert
      expect(result, equals('1г'));
    });
  });
}
