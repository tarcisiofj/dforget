import 'package:flutter/material.dart';
import 'pages/views/home.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/class/memo_dto.dart';

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
			// initialRoute: '/',
			//routes: {
		  //	'/':(_) => const Home(title: 'ComeLearn'),
			// situação de rotas nomeadas
			// 1.	
			//	'/MemoPage': (context)=> MemoPage(),
			// 2.
		  //	'/MemoPage': (context){
			//		final args = ModalRoute.of(context)!.settings.arguments as Map;
			//		return MemoPage(memo:args['memo']);
			//	}
		//	},// routes
			// 3. verificar no MemoPage a numeração correspondente ao 3
		//  onGenerateRoute: (RouteSettings settings){
		//		final String routeName = settings.name ?? '';
	
		//		switch(routeName){
		//			case '/MemoPage':	
		//					return MaterialPageRoute(
		//						builder: (BuildContext context) => MemoPage(),
		//					settings: settings,	
		//					);
		//		}
		//		
		//	}	
    );
  }
}

