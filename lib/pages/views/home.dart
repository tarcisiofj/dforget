import 'package:flutter/material.dart';
import '/widgets/barra_principal.dart';
import '/widgets/my_card.dart';
import 'package:dforget/class/memo.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/class/memoDAO.dart';



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
	List<String> toStudy  = ['Análise de Algoritmo', 'Programacao Linear', 'Álgebra Booleana'] ;
  
	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarraPrincipal( tle:'Barra Principal'),
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


	void _showMemoPage(Memo? memo) async{
		final recMemoPage = await Navigator.push(
				context,
				MaterialPageRoute(
						builder: (context)=> MemoPage(memo:memo))	
		);
		if(recMemoPage!=null){
			if(memo!=null){
//				await memodao.
			} else {
			
			}	
	//		getAllMemo();:
		}
	}

	void getAllMemo(){
		memodao.getMemo.then((list){
			setState( () {
				memories = list;
			});
		});
	}//getAllMemo

}
