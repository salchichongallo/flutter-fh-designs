import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:disenos/pages/basic.dart';
import 'package:disenos/pages/scroll.dart';
import 'package:disenos/pages/buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      initialRoute: Buttons.routeName,
      routes: {
        Basic.routeName: (_) => Basic(),
        Scroll.routeName: (_) => Scroll(),
        Buttons.routeName: (_) => Buttons(),
      },
    );
  }
}
