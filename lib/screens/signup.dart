import 'package:flutter/material.dart';
import '../backend/login.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'class.dart';
import 'package:studentmanagement/backend/home_page.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    roleController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(30),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      cursorColor: const Color.fromRGBO(157, 112, 209, 0.498),
                      cursorHeight: 23,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(105, 90, 223, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: "Name",
                        prefixIcon: Icon(Icons.input),
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: const Color.fromRGBO(157, 112, 209, 0.498),
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
                      cursorColor: const Color.fromRGBO(157, 112, 209, 0.498),
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
                            onPressed: () {const HomePage();},
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
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
                          controller: roleController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor:
                              const Color.fromRGBO(157, 112, 209, 0.498),
                          cursorHeight: 23,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(105, 90, 223, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: "Role",
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
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

                      ),
                    ],
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                        onPressed: () async {
                          if (await InternetConnectionChecker().hasConnection) {
                            if (emailController.text != "" &&
                                pwdController.text != "" &&
                                nameController.text != "" ) {
                              var val = await signUpCredentials(
                                  email: emailController.text,
                                  pwd: pwdController.text,
                                  name: nameController.text,
                              );

                              if (val != false && val != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Class())));
                              }else{
                                 showSimpleNotification(
                                        const Text("Access Denied"),
                                        background: Colors.red,
                                      );
                              }
                            }else{
                               showSimpleNotification(
                                        const Text("Acces Denied"),
                                        background: Colors.red,
                                      );
                            }
                          }else{
                            showSimpleNotification(
                                    const Text("No Internet"),
                                    background: Colors.red,
                                  );
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Already have an account?",
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
