import 'package:flutter/material.dart';
import 'package:studentmanagement/component/button.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            style: buttonTwoPrimary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: const Text(
              "SIGN IN",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

      ],
    );
  }
}
