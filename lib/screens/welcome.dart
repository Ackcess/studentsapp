import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main.dart';
import 'home.dart';
import 'signup.dart';
import '../backend/preferences.dart';
import '../backend/login.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:studentmanagement/backend/home_page.dart';
import 'package:studentmanagement/Screen/Welcome/welcome_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
    return Scaffold(
      backgroundColor: Colors.white70,
      body: value == true
          ? const WelcomeScreen()
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          child: LottieBuilder.asset(
                            "assets/jsons/79812-happy-student.json",
                            reverse: false,
                            repeat: false,
                          ),
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0.1),
                                blurRadius: 2,
                                spreadRadius: 0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor:
                                const Color.fromRGBO(157, 112, 209, 0.498),
                            cursorHeight: 23,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(105, 90, 223, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_sharp),
                              prefixIconColor: Colors.grey,
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0.1),
                                blurRadius: 2,
                                spreadRadius: 0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: TextField(
                            controller: pwdController,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor:
                                const Color.fromRGBO(157, 112, 209, 0.498),
                            cursorHeight: 23,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(105, 90, 223, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    simplePreferences.setAllowed();
                                  },
                                  icon: const Icon(Icons.accessibility)),
                              prefixIconColor: Colors.grey,
                              focusColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                        ),
                        InkWell(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(105, 90, 223, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: TextButton(
                              onPressed: () async {
                                if (await InternetConnectionChecker()
                                    .hasConnection) {
                                  if (emailController.text != "" &&
                                      pwdController.text != "") {
                                    var val = await LoginCredentials(
                                        email: emailController.text,
                                        pwd: pwdController.text);
                                    if (val != null && val != false) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const WelcomeScreen())));
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
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                            },
                            child: const Text("Create Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
