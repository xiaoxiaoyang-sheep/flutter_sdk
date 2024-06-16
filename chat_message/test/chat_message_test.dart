import 'package:chat_message/utils/wechat_date_format.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('wechat date format', () {
    debugPrint(WechatDateFormat.format(1972058683000).toString());
    debugPrint(WechatDateFormat.format(1772058683000).toString());
  });
}
