/// openai_flutter 抛出的异常
class AiException implements Exception {
  final String message;

  AiException(this.message);

  @override
  String toString() {
    return message;
  }
}

class AIResultException implements Exception {
  final String message;
  final int statusCode;

  AIResultException(this.message, this.statusCode);

  @override
  String toString() {
    return 'RequestFailedException {message: $message, statusCode: $statusCode}';
  }
}
