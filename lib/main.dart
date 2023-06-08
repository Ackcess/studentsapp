import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/class.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'screens/nonclass.dart';
import 'package:overlay_support/overlay_support.dart';
import 'splash.dart';
import 'backend/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await simplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management System',
        theme: ThemeData(),
        home: const Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  List<Widget> pages = [const MyHome(), const Class(), const NonClass()];
  Widget current = const MyHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(105, 90, 223, 1),
      body: current,
      bottomNavigationBar: CurvedNavigationBar(
          //animationDuration: const Duration(microseconds: 5),
          onTap: (val) {
            setState(() {
              i = val;
              current = pages[i];
            });
          },
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          color: Colors.white70,
          items: [
            Icon(
              Icons.person,
              size: 28,
              color: i == 0 ? Colors.orange : Colors.black,
            ),
            Icon(
              Icons.people,
              size: 28,
              color: i == 1 ? Colors.orange : Colors.black,
            ),
            Icon(
              Icons.cancel,
              size: 28,
              color: i == 2 ? Colors.orange : Colors.black,
            )
          ]),
    );
  }
}
