import 'package:dforget/class/memoDAO.dart';
import 'package:flutter/material.dart';
import 'pages/views/home.dart';

void main() {
  runApp(const MyApp());
	
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


	void buscarNomes() async {
		var db = await MemoDAO.internal().db;
		var result = await db.rawQuery('select * from teste');
		print(result);

	}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'ComeLearn '),
    );
  }
}

