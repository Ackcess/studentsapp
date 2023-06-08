import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:studentmanagement/backend/users_pets.dart';
import 'package:http/http.dart' as http;
import '../../model/course.dart';
import 'components/course_card.dart';
import 'package:studentmanagement/backend/home_page.dart';
import 'package:studentmanagement/screenss/home/components/course.dart';

class HomeScreen extends StatefulWidget {
  final  String name,isSusp,email,role;
  final bool isMon;
  const HomeScreen({Key? key, required this.name,required this.email,required this.role,required this.isSusp,required this.isMon}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{

  late UsersPets usersPets;
  bool isDataLoaded = false;
  String errorMessage = '';

  bool isMonitor = false;
  String isSuspend = "";


  Future<UsersPets> getDataFromAPI() async {
    Uri uri = Uri.parse('http://157.245.120.161:2340/user/all');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // All ok
      UsersPets usersPets = usersPetsFromJson(response.body);
      setState(() {
        isDataLoaded = true;

      });

      return usersPets;
    } else {
      errorMessage = '${response.statusCode}: ${response.body} ';
      return UsersPets(data: []);
    }
  }

  callAPIandAssignData() async {
    usersPets = await getDataFromAPI();
  }

  @override
  void initState() {
    callAPIandAssignData();
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    bool data = widget.isMon;
    String susp = widget.isSusp;
    setState(() {
      isMonitor = data;
      isSuspend = susp;
      print("~~~~~~~~~~~~~~~ $susp");
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 50, 250, 70),
      body: SafeArea(

        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.only(top: 40,right: 20,left: 20,bottom: 2),
                child: Text(
                  "Hi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),
                ),

              ),
              Padding(
                padding: EdgeInsets.only(top: 0,right: 20,left: 20,bottom: 20),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),

              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map((course) => Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CourseCard(course: course),
                            ))
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
                child: VerticalDivider(
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                height: 150,
                width: 360,
                decoration: const BoxDecoration(
                  color: Color(0xFF7553F6),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "STUDENT INFOS",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 8),
                            child: Text(
                              "Name: ${widget.name}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                          Text(
                            "Email: ${widget.email}",
                            style: const TextStyle(color: Colors.white54),
                          ),
                          const SizedBox(height: 9,),
                          Text("Role: ${widget.role}",
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                    // SvgPicture.asset(course.iconSrc)
                  ],
                ),

                ),

              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Activities",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),
                ),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SecondaryCourseCard(course: course,isMonitor: isMonitor,isSuspend: isSuspend),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    Key? key,
    required this.course,
    required this.isMonitor,
    required this.isSuspend
  }) : super(key: key);

  final Course course;
  final bool isMonitor;
  final String isSuspend;

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  child: Text(
                    course.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: (){
                    isMonitor ?
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: ((context) =>
                             HomePage(isSusp: isSuspend,)))): showSimpleNotification(
                      const Text("For Only Admins"),
                      background: Colors.blue,
                    );
                  },
                ),

                Text(
                  course.roled,
                  style: const TextStyle(color: Colors.white60, fontSize: 16),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 44,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(course.iconSrc),


        ],


      ),

    );


  }
}
