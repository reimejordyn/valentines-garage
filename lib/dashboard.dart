import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trial/onsite.dart';
//import 'package:trial/offsite.dart';
//import 'package:firebase_core/firebase_core.dart';




class Dashboard extends StatefulWidget {
   const Dashboard({Key? key, required String title}) : super(key: key);

   @override
   State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();



  final String title = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.black54),
            child: Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Text(
                'ONSITE',
                style: TextStyle(fontSize: 24),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Onsite(title: 'Onsite Checklist');
              }));
            },
          ),
          //offsite button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.black54),

    child: Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Text(
                'OFFSITE',
                style: TextStyle(fontSize: 24),
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: const Text('Offsite Job'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Employee Name',
                                ),
                              ),
                              TextFormField(
                                controller: customerController,
                                decoration: const InputDecoration(
                                  labelText: 'Customer Name',
                                ),
                              ),
                              TextFormField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  labelText: 'Job Description',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              Map<String,dynamic> data={'1':nameController.text, '2':customerController.text, '3':descriptionController.text};
                               FirebaseFirestore.instance.collection("offsite jobs").add(data);
                              nameController.clear();
                              customerController.clear();
                              descriptionController.clear();


                             }

                        )

                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}