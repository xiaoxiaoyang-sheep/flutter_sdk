/*
 *                   江城子 . 程序员之歌
 * 
 *               十年生死两茫茫，写程序，到天亮。
 *                   千行代码，Bug何处藏。
 *               纵使上线又怎样，朝令改，夕断肠。
 * 
 *               领导每天新想法，天天改，日日忙。
 *                   相顾无言，惟有泪千行。
 *               每晚灯火阑珊处，夜难寐，加班狂。
 * 
 * 
 * @Author: 赵晨炀 904852749@qq.com
 * @Date: 2024-06-13 21:45:34
 * @LastEditors: 赵晨炀 904852749@qq.com
 * @LastEditTime: 2024-06-15 18:59:46
 * @FilePath: /login_sdk/lib/pages/login_page.dart
 * @Description: 
 * 
 * Copyright (c) 2024 by 赵晨炀, All Rights Reserved. 
 */

import 'package:flutter/material.dart';
import 'package:login_sdk/dao/login_dao.dart';
import 'package:login_sdk/utils/padding_extension.dart';
import 'package:login_sdk/utils/string_util.dart';
import 'package:login_sdk/widgets/button_widget.dart';
import 'package:login_sdk/widgets/input_widget.dart';
import 'package:url_launcher/url_launcher.dart';

/// 登陆页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? username;
  String? password;
  get _background => [
        Positioned.fill(
            child: Image.network(
          'https://o.devio.org/images/bg_cover/robot.webp',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(color: Colors.black54),
        ))
      ];

  get _content => Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          100.paddingHeight,
          const Text(
            'ChartGPT',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          40.paddingHeight,
          InputWidget(
            hint: '请输入账号',
            onChanged: (text) {
              username = text;
              _checkInput();
            },
          ),
          40.paddingHeight,
          InputWidget(
            hint: '请输入密码',
            obscureText: true,
            onChanged: (text) {
              password = text;
              _checkInput();
            },
          ),
          45.paddingHeight,
          ButtonWidget(
            title: '登陆',
            enable: loginEnable,
            onPressed: () => _login(context),
          ),
          15.paddingHeight,
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _jumpRegistration,
              child: const Text(
                '注册账号',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [..._background, _content],
      ),
    );
  }

  void _jumpRegistration() async {
    var uri = Uri.parse(
        'https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPost');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $uri');
    }
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(username) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _login(BuildContext context) async {
    try {
      await LoginDao.login(username: username!, password: password!);
      debugPrint('登录成功');
      // todo goToHome
    } catch(e) {
      debugPrint(e.toString());
    }
  }
}
