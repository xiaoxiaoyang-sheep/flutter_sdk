/*
 *                   ___====-_  _-====___
 *             _--^^^#####//      \\#####^^^--_
 *          _-^##########// (    ) \\##########^-_
 *         -############//  |\^^/|  \\############-
 *       _/############//   (@::@)   \############\_
 *      /#############((     \\//     ))#############\
 *     -###############\\    (oo)    //###############-
 *    -#################\\  / VV \  //#################-
 *   -###################\\/      \//###################-
 *  _#/|##########/\######(   /\   )######/\##########|\#_
 *  |/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|
 *  `  |/  V  V  `   V  \#\| |  | |/#/  V   '  V  V  \|  '
 *     `   `  `      `   / | |  | | \   '      '  '   '
 *                      (  | |  | |  )
 *                     __\ | |  | | /__
 *                    (vvv(VVV)(VVV)vvv)
 * 
 *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 
 *                神兽保佑            永无BUG
 * 
 * @Author: 赵晨炀 904852749@qq.com
 * @Date: 2024-06-13 21:19:51
 * @LastEditors: 赵晨炀 904852749@qq.com
 * @LastEditTime: 2024-06-15 22:05:38
 * @FilePath: /login_sdk/lib/login_sdk.dart
 * @Description: 
 * 
 * Copyright (c) 2024 by 赵晨炀, All Rights Reserved. 
 */

library login_sdk;


import 'package:flutter/widgets.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';

class LoginConfig {
  static LoginConfig? _instance;
  Widget? homePage;

  static LoginConfig instance() {
    _instance ??= LoginConfig._();
    return _instance!;
  }

  // 初始化登录所需的配置
  Future<void> init({required Widget homePage}) async {
    this.homePage = homePage;
    await HiCache.preInit();
  }

  LoginConfig._();
}
