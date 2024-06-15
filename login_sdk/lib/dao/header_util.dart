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
 * @Date: 2024-06-15 18:41:02
 * @LastEditors: 赵晨炀 904852749@qq.com
 * @LastEditTime: 2024-06-15 19:09:21
 * @FilePath: /login_sdk/lib/dao/header_util.dart
 * @Description: 
 * 
 * Copyright (c) 2024 by 赵晨炀, All Rights Reserved. 
 */

import 'package:login_sdk/dao/login_dao.dart';

xyHeaders() {
  Map<String, String> header = {
    'auth-token': 'ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyddMC1mYQ==fg',
    'course-flag': 'fg',
    'boarding-pass': LoginDao.getBoardingPass() ?? ''
  };
  return header;
}
