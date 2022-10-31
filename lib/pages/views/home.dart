import 'package:flutter/material.dart';
import '/widgets/barra_principal.dart';
import '/widgets/my_card.dart';
import 'package:dforget/class/memo.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/class/memo_dao.dart';
import 'package:dforget/class/memo_dmo.dart';



class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

	List<Memo> memories = [];
	MemoDAO memodao = MemoDAO();
	MemoDMO memodmo = MemoDMO();
//	List<String> toStudy  = ['Análise de Algoritmo', 'Programacao Linear', 'Álgebra Booleana'] ;

	@override
	void initState(){
		super.initState();

//		Memo m = Memo();
//		m.titleMain ='Algebra Linear';
//		m.subtitle = 'variaveis ';
//		m.theme = 'programacao';
//		m.rev1h = 'hoje';
//		m.rev24h = 'amanha';
//		m.rev1week = '1 semana';
//		m.rev1month = '1 mes';
//		m.revAll = 'revisar Sempre';
//		m.color = Colors.blue.value;
//		m.listPdf = '0';
//		m.listImg = '1' ;
//	
//

//		memodao.getAllMemo().then((list){
//			print('dentro do initState e imprimindo a lista de memories');
//			print(list);
//			Memo m = list[1];
//			DateTime temp = DateTime.parse(m.rev1h!).add(Duration(days: 60));
//			print(temp);
//		  m.rev1h = temp.toString();
//			print(m.rev1h);
//			m.rev24h = temp.add(Duration(days:1)).toString();
//			m.rev1week = temp.add(Duration(days:7)).toString();
//			m.rev1month = temp.add(Duration(days:30)).toString();
//			m.revAll = temp.add(Duration(days:120)).toString();
//			m.subtitle = 'bd oracle';
//		   memodao.updateMemo(m);
//
//
//		});
		

		getAllMemo();
	}
  
	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarraPrincipal( tle:'Barra Principal'),
      body: Center(
        child: Padding(
					padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
           itemCount: memories.length,
					 itemBuilder: (context, index){
							return MyCard.full(memories[index]);
					 } , 
					),
				),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){
					_showMemoPage();
				},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


	void _showMemoPage({Memo? memo}) async{
		final recMemo = await Navigator.push(
				context,
				MaterialPageRoute(
						builder: (context)=> MemoPage(memo:memo))	
		);
		if(recMemo!=null){
			if(memo!=null){
				await memodmo.updateMemo(recMemo);
			} else {
				await  memodmo.save(recMemo);
			}	
		getAllMemo();
		}
	}

	void getAllMemo(){
		memodmo.getAllMemo().then((list) {
			setState( () {
				memories = list;
			});
		});
	}//getAllMemo

}
