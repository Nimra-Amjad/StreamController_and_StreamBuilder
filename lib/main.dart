// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  StreamController<int> countercontroller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder(
            stream: countercontroller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 40),
                );
              } else {
                return Text(
                  "0",
                  style: TextStyle(fontSize: 40),
                );
              }
            }),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter++;
            countercontroller.sink.add(counter);
          },
          child: Icon(Icons.add)),
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late StreamController myStreamController = StreamController();
//   late Stream myStream = myStreamController.stream.asBroadcastStream();

//   late StreamSubscription mysubs;

//   @override
//   void initState() {
//     mysubs = myStream.listen((event) {
//       print(event);
//     });

//     myStream.listen((event) {
//       print(event * 2);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Text("You have pushed the button this many times"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           myStreamController.sink.add(2);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
