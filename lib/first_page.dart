import 'dart:math';

import 'package:flutter/material.dart';

import 'global.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var value = 1.0;

  double textValue = 1.0;
  double randomValue = 0;
  @override
  void initState() {
    
    super.initState();
    var st = Global.uploadProgressController.stream;
    st.listen((event) {
      setState(() {
      textValue = event;  
      });
      
      

    });

    getRandomValues().listen((value) {
      setState(() {
        randomValue = value;
      });
  });
  }

  Stream<double> getRandomValues() async* {
    var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("STREAM"),
        actions: [
          IconButton(onPressed: () {
            var stream = Global.uploadProgressController;
            value = value + 0.5;
            stream.add(value);
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Text("$textValue"),Text("$randomValue"),]
      ),
    );
  }
}