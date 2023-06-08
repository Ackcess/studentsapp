import 'package:flutter/material.dart';
import 'package:studentmanagement/backend/home_page.dart';
import '../backend/preferences.dart';
import '../backend/login.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String email = '';
  String role = '';
  String level = '';
  String count = '';
  String name = '';
  @override
  void initState() {
    super.initState();
    email = simplePreferences.getEmail();
    role = simplePreferences.getRole();
    level = simplePreferences.getLevel();
    name = simplePreferences.getName();
    count = simplePreferences.getCount().toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(105, 90, 223, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(105, 90, 223, 1),
            actions: [
              IconButton(
                  onPressed: () {
                    simplePreferences.clear();
                    Navigator.of(context).pop(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 25,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(top: 90),
                        child: Container(
                          padding: const EdgeInsets.only(top: 50),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                              Text(
                                email,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                margin: const EdgeInsets.all(30),
                                height: 140,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0.6),
                                      blurRadius: 10,
                                      color: Colors.grey,
                                    )
                                  ],
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "ROLE",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 2,
                                          color: const Color.fromRGBO(
                                              105, 90, 223, 1),
                                        ),
                                        Text(
                                          role,
                                          style: const TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "LEVEL",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 2,
                                          color: const Color.fromRGBO(
                                              105, 90, 223, 1),
                                        ),
                                        Text(
                                          level,
                                          style: const TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "STUDENTS",
                                style: TextStyle(fontSize: 20),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 120,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0.6),
                                      blurRadius: 10,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                child: Text(
                                  count,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/graduating-student.png"),
                          minRadius: 20.0,
                          maxRadius: 60.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.6),
              blurRadius: 10,
              color: Colors.grey,
            )
          ],
          color: Colors.white70,
          shape: BoxShape.circle,
        ),
        child: IconButton(
            onPressed: () async {
              await const HomePage();
            },
            icon: const Icon(
              Icons.add,
              size: 32,
              color: Colors.orange,
            )),
      ),
    );
  }
}
