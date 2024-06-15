/*
 *                        _oo0oo_
 *                       o8888888o
 *                       88" . "88
 *                       (| -_- |)
 *                       0\  =  /0
 *                     ___/`---'\___
 *                   .' \\|     |// '.
 *                  / \\|||  :  |||// \
 *                 / _||||| -:- |||||- \
 *                |   | \\\  - /// |   |
 *                | \_|  ''\---/''  |_/ |
 *                \  .-\__  '-'  ___/-. /
 *              ___'. .'  /--.--\  `. .'___
 *           ."" '<  `.___\_<|>_/___.' >' "".
 *          | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *          \  \ `_.   \_ __\ /__ _/   .-` /  /
 *      =====`-.____`.___ \_____/___.-`___.-'=====
 *                        `=---='
 * 
 * 
 *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 
 *            佛祖保佑     永不宕机     永无BUG
 * 
 * @Author: 赵晨炀 904852749@qq.com
 * @Date: 2024-06-15 18:30:26
 * @LastEditors: 赵晨炀 904852749@qq.com
 * @LastEditTime: 2024-06-15 19:20:41
 * @FilePath: /login_sdk/lib/dao/login_dao.dart
 * @Description: 
 * 
 * Copyright (c) 2024 by 赵晨炀, All Rights Reserved. 
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:http/http.dart' as http;

import 'header_util.dart';

class LoginDao {
  static const kUserInfo = 'user_info';

  // 登录
  static login({required String username, required String password}) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = username;
    paramsMap['password'] = password;

    var uri = Uri.https('api.devio.org', '/uapi/user/login', paramsMap);
    final response = await http.post(uri, headers: xyHeaders());

    Utf8Decoder utf8decoder = const Utf8Decoder(); // fix 中文乱码
    String bodyString = utf8decoder.convert(response.bodyBytes);
    debugPrint(bodyString);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        Map<String, dynamic> extra = result['extra'];
        // 保存登录信息
        _saveUserInfo(
          boardingPass: result['data'],
          userName: extra['userName'],
          avatar: extra['avatar'],
          imoocId: extra['imoocId'],
        );
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  // 保存登录用户信息
  static void _saveUserInfo(
      {required boardingPass,
      required userName,
      required avatar,
      required imoocId}) {
    var map = {
      'boardingPass': boardingPass,
      'avatar': avatar,
      'imoocId': imoocId,
      'userName': userName,
      'accountHash': userName.hashCode,
    };
    HiCache.getInstance().setString(kUserInfo, jsonEncode(map));
  }

  // 获取当前用户登录信息
  static Map<String, dynamic>? getUserInfo() {
    var result = HiCache.getInstance().get(kUserInfo);
    if (result != null) {
      return jsonDecode(result);
    }
    return null;
  }

  // 获取登录token
  static String? getBoardingPass() {
    var result = HiCache.getInstance().get(kUserInfo);
    if (result != null) {
      var map = jsonDecode(result);
      return map['boardingPass'];
    }
    return null;
  }

  // 获取用于常见多账号数据的账号标识
  static String? getAccordingHash() {
    var result = HiCache.getInstance().get(kUserInfo);
    if (result != null) {
      var map = jsonDecode(result);
      return map['accordingHash'].toString();
    }
    return null;
  }

  // 登出
  static void logOut() {
    // 移除登录保存的信息
    HiCache.getInstance().remove(kUserInfo);
    // todo goToLogin
  }
}
