/// openai_flutter SDK配置工具
class AiConfigBuilder {
  /// 注意
  /// 1. 使用电脑的IP地址，不要用127.0.0.1 （在Andrioid上会被识别成Android设备的本地机）
  /// 2. 如果使用clashX需要开启Allow connect from Lan，否则会：connection refused
  /// ed： 129:169.1.150:7890
  String? _proxy;
  static final AiConfigBuilder _instance = AiConfigBuilder._();

  static void init(String apiKey, {String? proxy}) {
    _instance._proxy = proxy;
  }

  static AiConfigBuilder get instance => _instance;

  String? get proxy => _proxy;

  // set proxy
  void setProxy(String? proxy) {
    _proxy = proxy;
  }

  AiConfigBuilder._();
}
