/*
 * Copyright (C) 2005-present, 58.com.  All rights reserved.
 * Use of this source code is governed by a BSD type license that can be
 * found in the LICENSE file.
 */

import 'package:fair/fair.dart';
import 'package:fair_example/src/page/hello_world_proxy2.dart';
import 'package:fair_example/src/page/modules.dart';
import 'package:flutter/material.dart';

import 'src/page/hello_world_proxy.dart';
import 'src/page/sample_dynamic_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FairApp(
    delegate: {
      // 'hello_world': (ctx, _) => HelloWorldDelegate(),
      'hello_world': (ctx, _) => HelloWorldDelegate2(),
      'hello_world2': (ctx, _) => HelloWorldDelegate2(),
    },
    modules: {
      ShowFairAlertModule.tagName: () => ShowFairAlertModule(),
    },
    child: MaterialApp(
      home: FairWidget(
        name: 'hello_world',
        jsPath:'file:///android_asset/lib_src_page_sample_page_with_logic.js',
        path: 'assets/bundle/lib_src_page_hello_world.fair.bin',
      ) /*HelloWorldPage()*/,
      routes: {
        'sample_dynamic_page': (_) => SampleDynamicPage(),
      },
    ),
  ));
}
