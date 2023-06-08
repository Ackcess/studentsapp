import 'package:flutter/material.dart';

class NonClass extends StatefulWidget {
  const NonClass({super.key});

  @override
  State<NonClass> createState() => _NonClassState();
}

class _NonClassState extends State<NonClass> {
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
            title: const Text(" InActive Students"),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(top: 16, bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
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
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                child: ListView.builder(
                  controller: control,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) => Container(
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
                    child: InkWell(
                      onTap: () {},
                      onHover: (val) {},
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/graduating-student.png"),
                        ),
                        title: const Text(
                          "Elius Faustine",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text(
                          "Student",
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          splashColor: Colors.blueGrey,
                          splashRadius: 9,
                          onPressed: () {},
                          icon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
