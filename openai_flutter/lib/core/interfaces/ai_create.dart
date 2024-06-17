import 'package:openai_flutter/models/ai_response.dart';

abstract class AiCreateInterface {
  Future<AIResponse> createChat(
      {String model = 'gpt-3.5-turbo',
      dynamic prompt,
      int? maxTokens = 200,
      double? temperature,
      double? topP,
      int? n,
      String? stop,
      String? user});
}
