import 'package:flutter/material.dart';
import 'package:studentmanagement/component/button.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:studentmanagement/screenss/home/home_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:studentmanagement/backend/login.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    nameController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 130),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                // obscureText: true,
                cursorColor: kPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.email),
                  ),
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
                  hintText: "Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.password),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              style: buttonTwoPrimary,
              onPressed: () async {

                if (await InternetConnectionChecker().hasConnection) {


                  if (emailController.text != "" &&
                      pwdController.text != "" &&
                      nameController.text != "" ) {
                    String name,email,role,isSusp;
                    bool isMoni;

                    var val = await signUpCredentials(
                        email: emailController.text,
                        pwd: pwdController.text,
                        name: nameController.text
                    );

                    var values = val;
                    var vals = values?[5];

                    name = values?[0];
                    email = values?[1];
                    isSusp = values?[4];
                    isMoni = values?[3];
                    role = values?[2];


                    if ( vals != null ) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                    }
                  }
                }else{
                  showSimpleNotification(
                    const Text("No Internet"),
                    background: Colors.red,
                  );
                }
              },
              child: Text("Sign Up".toUpperCase()),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}