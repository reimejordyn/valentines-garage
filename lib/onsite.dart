import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:trial/dashboard.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'firebase_options.dart';
//import 'package:trial/offsite.dart';


//DatabaseReference ref = FirebaseDatabase.instance.ref();


class Onsite extends StatefulWidget {
  const Onsite({Key? key, required String title}) : super(key: key);
  @override
  State<Onsite> createState() => _OnsiteState();
}



class _OnsiteState extends State<Onsite> {
  TextEditingController controller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;
  bool valuefifth = false;
  bool valuesix = false;
  bool valueseven = false;
  bool valueeight = false;
  bool valuenine= false;
  bool valueten = false;
  final String title = 'Onsite Checklist';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('ONSITE CHECKLIST'),),
        body: SingleChildScrollView(
            padding: new EdgeInsets.all(22.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Customer information"),
                  onChanged: (text) => setState(() {
                    String currentText = text;
                    Text(currentText);
                  }),
                ),

                const SizedBox(width: 10,),
                const Text('SHORT TERM CHECKLIST',style: TextStyle(fontSize: 20.0), ),
                CheckboxListTile(
                  title: const Text('Oil and coolant levels'),
                  value: valuefirst,
                  onChanged: (value) {
                    setState(() {
                      valuefirst = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Air Filter'),
                  value: valuesecond,
                  onChanged: (value) {
                    setState(() {
                      valuesecond = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Tire Pressure and tread depth'),
                  value: valuethird,
                  onChanged: (value) {
                    setState(() {
                      valuethird = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Headlights, turn signals, brake and parking lights'),
                  value: valuefourth,
                  onChanged: (value) {
                    setState(() {
                      valuefourth = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Oil and Filter'),
                  value: valuefifth,
                  onChanged: (value) {
                    setState(() {
                      valuefifth = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Rotate tires'),
                  value: valuesix,
                  onChanged: (value) {
                    setState(() {
                      valuesix = value!;
                    });
                  },
                ),
                const Text('LONG TERM CHECKLIST',style: TextStyle(fontSize: 20.0), ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Transmission Fluid'),
                  value: valueseven,
                  onChanged: (value) {
                    setState(() {
                      valueseven = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Transfer case fluid'),
                  value: valueeight,
                  onChanged: (value) {
                    setState(() {
                      valueeight = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Inspect shocks and struts'),
                  value: valuenine,
                  onChanged: (value) {
                    setState(() {
                      valuenine = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Spark Plugs'),
                  value: valueten,
                  onChanged: (value) {
                    setState(() {
                      valueten = value!;
                    });
                  },
                ),
            Container(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                child: const Text(
                  'Back to Dashboard',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
                Container(
                    alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      Map<String,dynamic> data={'1':descriptionController.text,'2':valuefirst, '3':valuesecond, '4':valuethird,'5':valuefourth, '6':valuefifth,'7':valuesix,'8':valueseven,'9':valueeight,'91':valuenine,'92':valueten,};
                      FirebaseFirestore.instance.collection("onsite jobs").add(data);
                      descriptionController.clear();

                    }

                )
                ),



              ],
            )
        ),
      ),

    );
  }
}
