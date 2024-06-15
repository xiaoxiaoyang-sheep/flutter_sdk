/*
 *                        .::::.
 *                      .::::::::.
 *                     :::::::::::
 *                  ..:::::::::::'
 *               '::::::::::::'
 *                 .::::::::::
 *            '::::::::::::::..
 *                 ..::::::::::::.
 *               ``::::::::::::::::
 *                ::::``:::::::::'        .:::.
 *               ::::'   ':::::'       .::::::::.
 *             .::::'      ::::     .:::::::'::::.
 *            .:::'       :::::  .:::::::::' ':::::.
 *           .::'        :::::.:::::::::'      ':::::.
 *          .::'         ::::::::::::::'         ``::::.
 *      ...:::           ::::::::::::'              ``::.
 *     ````':.          ':::::::::'                  ::::..
 *                        '.:::::'                    ':'````..
 * 
 * @Author: 赵晨炀 904852749@qq.com
 * @Date: 2024-06-15 17:42:25
 * @LastEditors: 赵晨炀 904852749@qq.com
 * @LastEditTime: 2024-06-15 17:45:25
 * @FilePath: /login_sdk/lib/utils/padding_extension.dart
 * @Description: 
 * 
 * Copyright (c) 2024 by 赵晨炀, All Rights Reserved. 
 */



import 'package:flutter/material.dart';

// 扩展int
extension IntFix on int {
  // eg: 200.px
  SizedBox get paddingHeight {
    return SizedBox(height: toDouble());
  }

  SizedBox get paddingWidth {
    return SizedBox(width: toDouble());
  }
}

// 扩展double
extension DoubleFix on double {
  // eg: 200.px
  SizedBox get paddingHeight {
    return SizedBox(height: this);
  }

  SizedBox get paddingWidth {
    return SizedBox(width: this);
  }
}