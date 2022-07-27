import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int result=0,num=0,num1=0;
  String history = ' ';
  //listHis(String history, int result){
  //  return history + ' ' + result.toString();
  //}
  add(){
    setState(() {
      num = int.parse(controller1.text);
      num1 = int.parse(controller2.text);
      result = num + num1;
      history += result.toString() + ' ';
    });
  }
  sub(){
    setState(() {
      num = int.parse(controller1.text);
      num1 = int.parse(controller2.text);
      result = num - num1;
      history += result.toString() + ' ';;
    });
  }
  mul(){
    setState(() {
      num = int.parse(controller1.text);
      num1 = int.parse(controller2.text);
      result = num * num1;
      history = history += result.toString() + ' ';;
    });
  }
  div(){
    setState(() {
      num = int.parse(controller1.text);
      num1 = int.parse(controller2.text);
      result = num ~/ num1;
      history = history += result.toString() + ' ';;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator with History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            Text(
              "RESULT: $result",
              style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: "Enter First Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero
                )

              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                  labelText: "Enter Second Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero
                  )

              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  add();
                  controller1.clear();
                  controller2.clear();
                }, child: Text("    Add       ")),
                ElevatedButton(onPressed: (){
                  sub();
                  controller1.clear();
                  controller2.clear();
                }, child: Text(" Subtraction  ")),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  mul();
                  controller1.clear();
                  controller2.clear();
                }, child: Text("Multiplication")),
                ElevatedButton(onPressed: (){
                  div();
                  controller1.clear();
                  controller2.clear();
                }, child: Text("   Division   ")),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "History: $history",
              style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
