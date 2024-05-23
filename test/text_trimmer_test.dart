import 'package:coursor_tiktok/ui/utils/text_trimmer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextTrimmer test', () {
    test('Text length less than trim length', () {
      final trimmer = TextTrimmer();

      final result = trimmer.trimText('normal text', 20);

      expect(result, equals('normal text'));
    });

    test('Text length equals to trim length', () {
      final trimmer = TextTrimmer();

      final result = trimmer.trimText('normal text', 'normal text'.length);

      expect(result, equals('normal text'));
    });

    test('Text length greater than trim length', () {
      final trimmer = TextTrimmer();

      final result = trimmer.trimText('normal text', 3);

      expect(result, equals('nor...'));
    });
  });
}
