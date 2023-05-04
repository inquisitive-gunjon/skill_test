import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/view/page_one.dart';
import 'package:soft_bd_skill_test/view_model/bottom_navigationbar_viewmodel.dart';
import 'package:soft_bd_skill_test/view_model/page_two_view_model.dart';
import 'di_container.dart' as di;



Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();

  await di.init();


  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => di.sl<BottomNavigationBarViewModel>()),
        ChangeNotifierProvider(create: (context) => di.sl<PageTwoViewModel>()),
      ],
          child: const MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoftBd Skill Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ColorResources.primaryColor
      ),
      home: PageOne(),
    );
  }
}





class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}