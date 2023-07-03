import 'package:flutter/material.dart';
import 'package:synapsis_project/pages/authenticate/login_page.dart';
import 'package:synapsis_project/pages/screen/first_page.dart';
import 'package:synapsis_project/pages/screen/second_page.dart';
import 'package:synapsis_project/pages/screen/third_page.dart';
import 'package:synapsis_project/services/database_helper.dart';

import 'color_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseHelper();
  await db.initDb();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: ColorConstants.mainColor),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
      routes: {
        'login_page': (context) => const LoginPage(),
        'first_page': (context) => const FirstPage(),
        'second_page': (context) => const SecondPage(),
        'third_page': (context) => const ThirdPage(),
      },
    );
  }
}
