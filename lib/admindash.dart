
import 'package:flutter/material.dart';




class Admindash extends StatefulWidget {
  const Admindash({Key? key, required String title}) : super(key: key);

  @override
  State<Admindash> createState() => _AdmindashState();
}


class _AdmindashState extends State<Admindash> {
  final String title = 'Admin Dashboard';



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
  'REPORTS',
  style: TextStyle(fontSize: 24),
  ),
  ),
  onPressed: () {
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
  '+ ADD TASKS',
  style: TextStyle(fontSize: 24),
  ),
  ),
  onPressed: () {},
  ),
  ],
  ),
  );
  }
  }
