import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:studentmanagement/backend/admit_status.dart';
import 'users_pets.dart';
import 'package:studentmanagement/backend/change_status.dart';
import 'package:studentmanagement/backend/login.dart';
import 'package:studentmanagement/component/button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.userPet});
  final Datum userPet;

  final bool _isSuspended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent.shade200,
        appBar: AppBar(
          title: Text(userPet.username),
          centerTitle: true,
            backgroundColor: Colors.deepPurple
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),

                const SizedBox(height: 12,),

                Container(
                  height: 90,
                  width: 300,

                  decoration: const BoxDecoration(
                    color: Colors.black12,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),

                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                         children: [
                           ElevatedButton(
                             style: buttonOnePrimary,
                             onPressed: () async {
                               var val = await changeStateAdmit(
                                 id: userPet.id,
                               );
                               if (val==true){
                                 showSimpleNotification(
                                   Text("${userPet.username} account activated ."),
                                   background: Colors.blue,
                                 );
                               }else{
                                 showSimpleNotification(
                                   const Text("Deactivation Failed"),
                                   background: Colors.blue,
                                 );
                               }
                             },
                             child: Text("Admission".toUpperCase()),
                           ),
                           ElevatedButton(
                             style: buttonOnePrimary,
                             onPressed: () async {
                               var val = await changeStateSuspend(
                                 id: userPet.id,
                               );
                               if (val==true){
                                 showSimpleNotification(
                                   Text("${userPet.username} account deactivated."),
                                   background: Colors.blue,
                                 );
                               }else{
                                 showSimpleNotification(
                                   const Text("Deactivation Failed"),
                                   background: Colors.red,
                                 );
                               }
                             },
                             child: Text("Suspend".toUpperCase()),
                           ),
                         ],

                    ),
                    const SizedBox(height: 23),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        ElevatedButton(
                          style: buttonOnePrimary,
                          onPressed: () async {
                            var val = await makeAdmin(
                              id: userPet.id,
                            );

                            print(val);
                            if (val==true){
                              showSimpleNotification(
                                Text("${userPet.username} is now an admin."),
                                background: Colors.blue,
                              );
                            }else{
                              showSimpleNotification(
                                const Text("Permission Denied"),
                                background: Colors.blue,
                              );
                            }


                          },
                          child: Text("To Admin"),
                        ),
                        ElevatedButton(
                          style: buttonOnePrimary,
                          onPressed: () async {
                            var val = await removeAdmin(
                              id: userPet.id,
                            );

                            print(val);
                            if (val==true){
                              showSimpleNotification(
                                Text("${userPet.username} is not an admin."),
                                background: Colors.blue,
                              );
                            }else{
                              showSimpleNotification(
                                const Text("Permission Denied"),
                                background: Colors.red,
                              );
                            }


                          },
                          child: const Text("Del Admin",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                      ],

                    )
                  ],
                ),

                // Text(
                  // userPet.email,
                //   style: const TextStyle(fontSize: 24),
                // ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),


              ],
            ),
          ),
        ));
  }


}
