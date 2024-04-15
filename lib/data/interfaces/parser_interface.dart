abstract class ParserInterface<T> {
  /// Parses data from the server
  T parse(Map<String, dynamic> data);
}