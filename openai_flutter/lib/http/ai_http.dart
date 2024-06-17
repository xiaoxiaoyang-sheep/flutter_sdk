import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:openai_flutter/http/ai_config.dart';
import 'package:openai_flutter/http/ai_exception.dart';
import 'package:openai_flutter/utils/ai_logger.dart';
import 'package:http/http.dart' as http;

/// http请求工具类
class AiHttp {
  static Future<T> post<T>(
      {required String url,
      required T Function(Map<String, dynamic>) onSuccess,
      Map<String, dynamic>? body}) async {
    AiLogger.log('starting request to $url');

    /// 借助HtttpClient来发送请求
    HttpClient httpClient = HttpClient();

    /// 设置代理
    var proxy = AiConfigBuilder.instance.proxy;
    if (proxy != null && proxy.trim().isNotEmpty) {
      httpClient.findProxy = (uri) {
        return "PROXY $proxy";
      };
    }

    IOClient myClient = IOClient(httpClient);
    final http.Response response = await myClient.post(Uri.parse(url),
        body: body != null ? jsonEncode(body) : null);
    AiLogger.log(
        'request to $url finished with status code: $response.statusCode}');
    AiLogger.log('starting decoding response body');

    /// 防止乱码
    Utf8Decoder utf8decoder = const Utf8Decoder();
    final Map<String, dynamic> decodedBody =
        jsonDecode(utf8decoder.convert(response.bodyBytes))
            as Map<String, dynamic>;
    AiLogger.log('response body decoded successfully');
    if (decodedBody['error'] != null) {
      AiLogger.log('an error occurred, throwing exception');
      final Map<String, dynamic> error = decodedBody['error'];
      throw AIResultException(error['message'], response.statusCode);
    } else {
      AiLogger.log('request finished successfully');
      return onSuccess(decodedBody);
    }
  }
}
