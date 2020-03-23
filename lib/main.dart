import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_admin/pages/layout/appListLayout.dart';
import 'package:flutter_admin/pages/login.dart';
import 'package:flutter_admin/pages/person/appList.dart';
import 'package:flutter_admin/pages/userInfo/userInfoEdit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'mobile_platform',
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Test1(),
        // home: PersonList(),
        // home: Register(),
        home: Login(),
        // home: Layout1(),
      ),
    );
  }
}
