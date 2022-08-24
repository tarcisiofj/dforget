import 'package:flutter/material.dart';
import '/widgets/barra_principal.dart';
import '/widgets/my_card.dart';





class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

	List<String> toStudy  = ['Análise de Algoritmo', 'Programacao Linear', 'Álgebra Booleana'] ;
  
	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraPrincipal( tle:'Barra Principal'),
      body: Center(
        child: Padding(
					padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
           itemCount: toStudy.length,
					 itemBuilder: (context, index){
							return MyCard.full(toStudy[index]);
					 } , 
					),
				),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


	void _showInsMem(){
		Navigator.push(context,
			MaterialPageRoute(builder: (context)=> )	
		);
	}
}
