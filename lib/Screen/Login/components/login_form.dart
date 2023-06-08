import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:studentmanagement/backend/preferences.dart';
import 'package:studentmanagement/backend/login.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:studentmanagement/screenss/home/home_screen.dart';
import 'package:studentmanagement/component/button.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  late bool value = false;
  @override
  void initState() {
    super.initState();
    value = simplePreferences.getAllowed() == null
        ? false
        : simplePreferences.getAllowed()!;
    emailController.text = simplePreferences.getEmail();
    pwdController.text = "";
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 154),

      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: true,
              scrollPhysics: const ScrollPhysics(),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.center,
              // textAlign: TextAlign.center,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                hintStyle: TextStyle(color: Colors.blue),
                filled: true,
                hintText: "Username",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(

                controller: pwdController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)
                  ),

                  hintStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  hintText: "Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                style: buttonTwoPrimary,
                onPressed: () async {

                  if (await InternetConnectionChecker()
                      .hasConnection) {

                    if (emailController.text != "" && pwdController.text != "") {
                      String name,email,isSusp,role;
                      bool isMoni;

                      var val = await LoginCredentials(
                          email: emailController.text,
                          pwd: pwdController.text);

                      var values = val;
                      print(values);

                      var vals = values?[5];

                       name = values?[0];
                       email = values?[1];
                       isSusp = values?[4];
                       isMoni = values?[3];
                       role = values?[2];

                      if (vals != null && vals != false) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) =>
                                 HomeScreen(name: name,email: email,role: role,isSusp: isSusp,isMon: isMoni))));
                      } else {
                        showSimpleNotification(
                          const Text("Access Denied"),
                          background: Colors.red,
                        );
                      }
                    } else {
                      showSimpleNotification(
                        const Text("Access Denied"),
                        background: Colors.red,
                      );
                    }
                  } else {
                    showSimpleNotification(
                      const Text("No Internet"),
                      background: Colors.red,
                    );
                  }
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            const Text("Welcome",style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                // fontSize: 20
            )),
          ],
        ),
      ),
    );
  }
}
