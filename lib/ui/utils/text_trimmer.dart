class TextTrimmer {
  String trimText(String initialText, int len) {
    if (initialText.length > len) {
      return '${initialText.substring(0, len)}...';
    }
    return initialText;
  }
}