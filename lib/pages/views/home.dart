import 'package:flutter/material.dart';
import '/widgets/barra_principal.dart';
import '/widgets/my_card.dart';
import 'package:dforget/class/memo_dto.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/class/memo_dao.dart';
import 'package:dforget/class/memo_dmo.dart';
import 'package:dforget/widgets/nav.dart';



class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

	List<MemoDTO> memories = [];
	MemoDAO memodao = MemoDAO();
	MemoDMO memodmo = MemoDMO();
//	List<String> toStudy  = ['Análise de Algoritmo', 'Programacao Linear', 'Álgebra Booleana'] ;

	@override
	void initState(){
		super.initState();

//		MemoDTO m = MemoDTO(
//				"", "", "", "", "", "",rev1h="", this.color="", listPdf, listImg,"");
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

//		memodao._getAllMemo().then((list){
//			print('dentro do initState e imprimindo a lista de memories');
//			print(list);
 			//memodao.deleteMemoAllReg();
			//print('apagou todos registros');
		//	List <String>listasPDF =<String>["um","dois"];
		//	
		//	MemoDTO m = MemoDTO.empty(); 
		//	m.rev1h = DateTime.now().toString();
		//	DateTime temp = DateTime.parse(m.rev1h!).add(Duration(days:30 ));
		//	print(temp);
		//  m.rev1h = temp.toString();
		//	m.color= Colors.blue.value;
		//	m.rev24h = temp.add(Duration(days:1)).toString();
		//	m.rev1week = temp.add(Duration(days:7)).toString();
		//	m.rev1month = temp.add(Duration(days:30)).toString();
		//	m.revAll = temp.add(Duration(days:120)).toString();
		//	m.subtitle = 'paradoxal';
		//	m.titleMain = 'Filosofia viral';
		//	m.theme = 'aqui é o conteúdo do texto a ser aprendido';
		//	//m.listImg?.add("/imagens/img.jpg"); //= ["magensfoto1.jpg","imagensfoto2.jpg"];
		//	m.listPdf = "arquivo.pdf,arquivo2.pdf";

		//	
		//	print("O objeto a ser salvo é: ");
		//print(m);	
			
	    //memodao.updateMemo(m);
		//	memodao.saveMemo(m);

//		});
		
 	//	memodao.deleteMemoAllReg();
		getAllMemo();
	}
  
	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarraPrincipal( tle:'Dont Forget'),
      body: Center(
        child: Padding(
					padding: const EdgeInsets.fromLTRB(8,8,8,70),
          child: ListView.builder(
           itemCount: memories.length,
					 itemBuilder: (context, index){
							return  MyCard.full(memories[index],showMemoPage);
					
					 } , 
					),
				),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){
					showMemoPage();
				},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


	void showMemoPage({MemoDTO? memo}) async{
		MemoDTO	recMemo = await push(context,MemoPage(memo:memo));
		if(memo==null){
				if(recMemo!=null)
					await memodmo.save(recMemo);
		}else{
				if(recMemo!=null)
					await memodmo.updateMemo(recMemo);
		}
		//Future  recMemo = Navigator.of(context).pushNamed('/MemoPage', arguments:{'memo':memo});
	//		if(recMemo!=null){
	//			if(memo!=null){
	//				await memodmo.updateMemo(recMemo);
	//			} else {
	//				await  memodmo.save(recMemo);
	//			}	

	 getAllMemo();
//		memodmo.getAllMemo().then( (list) {
//					setState( () {
//						memories = list;
//					});
//				});
			// } // if(recMemo)
  }

	void getAllMemo(){
		memodmo.getAllMemo().then((list) { 
			setState( () {
				memories = list;
			});
		});
	}//_getAllMemo

}
