import 'package:flutter/material.dart';

import '../backend/login.dart';
import 'package:studentmanagement/backend/home_page.dart';


class Class extends StatefulWidget {
  const Class({super.key});

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  late ScrollController control;
  @override
  void initState() {
    super.initState();
    control =
        ScrollController(initialScrollOffset: 0.0, keepScrollOffset: false);
  }

  @override
  void dispose() {
    control.dispose();
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
            pinned: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(105, 90, 223, 1),
            title: const Text(
              "Active Attendance",
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(top: 16, bottom: 8),
                  //padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "120",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      )
                    ],
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height * 0.74,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: FutureBuilder(

                    builder: (context, snapshot) {
                      return ListView.builder(
                        controller: control,
                        shrinkWrap: true,

                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white70.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0.6),
                                blurRadius: 10,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: const ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  "assets/images/graduating-student.png"),
                            ),

                            subtitle: Text("Student"),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
