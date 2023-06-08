import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'screens/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController control;
  @override
  void initState() {
    super.initState();
    control =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    control.addListener(() {
      if (control.isCompleted) {
        control.reset();
        control.forward().then((value) => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Welcome())));
      }
    });
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset(
                  width: 160,
                    height: 160,
                    "assets/jsons/142418-student-gossiping-learning-app-lottie-json-animation.json",
                    reverse: false,
                    controller: control, onLoaded: (val) {
                  control
                    ..duration = val.duration
                    ..forward().then((value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Welcome()));
                    });
                }),
              ),
              const Text(
                "STUDENTS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.lightBlue
                ),
              )
            ],
          )),
    );
  }
}
