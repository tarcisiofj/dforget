import 'package:flutter/material.dart';
import 'pages/views/home.dart';
import 'package:dforget/pages/include/memo_page.dart';

void main() {
  runApp(const MyApp());
	
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'ComeLearn '),
			//home:MemoPage()
    );
  }
}

