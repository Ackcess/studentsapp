import 'package:flutter/material.dart';
import 'details_page.dart';
import 'users_pets.dart';
import 'package:http/http.dart' as http;
import 'package:studentmanagement/Screen/Signup/signup_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,  this.isSusp}) : super(key: key);
   final  isSusp;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UsersPets usersPets;
  bool isDataLoaded = false;
  String errorMessage = '';
  String isSuspended = "";
  bool isSuspend = false;

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
  }


  @override
  Widget build(BuildContext context) {
    String susp = widget.isSusp;
    setState(() {
      isSuspended = susp;
      if (isSuspended=="Suspended"){
        isSuspend = true;
      }
      else{
        isSuspend = false;
      }

    });
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      appBar: AppBar(
        title: const Text('Students Attendance'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,

      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 23),
        child: isDataLoaded
            ? errorMessage.isNotEmpty
            ? Text(errorMessage)
            : usersPets.data.isEmpty
            ? const Text('No Data')
            : ListView.builder(

          itemCount: usersPets.data.length,
          itemBuilder: (context, index) => getRow(index),
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SignUpScreen();
              },
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),

    );
  }

  Widget getRow(int index) {
    return Card(
      color: Colors.white,
      elevation: 22,
      child: ListTile(



        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(userPet: usersPets.data[index]),
              ));
        },

        leading: const CircleAvatar(
          radius: 10,
            backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black12,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              usersPets.data[index].username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),


            Text('Status: ${usersPets.data[index].classLevel}',
              style: isSuspend ? const TextStyle(
                color: Colors.black45
              ): const TextStyle(
                color: Colors.black45
              ),
            ),
          ],

        ),


      ),

      
    );

  }
}

