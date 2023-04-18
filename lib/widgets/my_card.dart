import 'package:dforget/widgets/nav.dart';
import 'package:flutter/material.dart';
import 'package:dforget/class/memo_dto.dart';
import 'package:dforget/class/memo_dmo.dart';
import 'package:dforget/core/constants.dart';
import 'package:path/path.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/widgets/nav.dart';

class MyCard extends StatelessWidget {
 	MyCard({
    Key? key,
  }) : super(key: key);

	late String titulo;
	MemoDTO? memo;
	MemoDMO memodmo = MemoDMO();
	late Function  showMemoPage;

 	MyCard.full(this.memo,this.showMemoPage);

  	@override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
      	child: SizedBox(
      		height: 145.0,
      		child: Row(
      			crossAxisAlignment: CrossAxisAlignment.stretch,
      			children: <Widget>[
      					 Container(
      							color: Color(memo?.getColor ?? 0) ,
      							padding: const EdgeInsets.symmetric(horizontal: 5.0),
      							// child: Text(                  "",style: new TextStyle(color: Colors.white),),
      					 ),//container
      					 Expanded(
      						 child:	Column(
      						   children: [
      						     ListTile(
      									 title: Text(
													 memo?.titleMain ?? "",
													 style:TextStyle(
															 fontWeight: FontWeight.bold) ,),
      									 subtitle: RichText(
      												text:  TextSpan( 
      													style: TextStyle(color: Colors.black),
      							 				  		children: [
      							 				    		TextSpan(text: memo?.subtitle ?? '',),
      							 				    		TextSpan(text: '\nPróxima Revisão:',style: TextStyle(color: Colors.black87)),
      												  		TextSpan(text: '03/04/2022',style: TextStyle(color: Colors.black54)),
      											  		]
      												)
      									 ),// subtitle, Text('Próxima Revisão: 03/02/22 \n terceira linha ') ,
      									 trailing: Column(children: [
												 Icon(
														 Icons.photo,
														 color: Colors.blueAccent,
														 semanticLabel:'Possui Imagens',
														 ),// Icon photo
												 Icon(Icons.picture_as_pdf,
														 color: Colors.red,
														 semanticLabel: 'Possui PDF',)//Icon pdf
											 ],), //Icon(Icons.circle_notifications),
										//	 onTap: (){
										//	 	print('Clicou');
										//		_showMemoPage(context,memo!);
										//	 },
      									 //leading: Icon(Icons.circle,color: Colors.greenAccent),
      									 //isThreeLine:true ,
      								),//ListTile
								 InkWell(
  									splashColor: Colors.white10, // Splash color over image
  									child: Ink.image(
      										fit: BoxFit.cover, // Fixes border issues
      										width: 300,
      										height: 60,
      										image: AssetImage(_imgProgress(memo!)),
  									),//child
								 ),//InkWell
      						//Image.asset('images/bar_rev_1_nm2.png',width: 300, height:70,)
      						//Image.asset(_imgProgress(),width: 300, height:70,)

      						],//children 
      					),//Column
      					),//Expanded
      				],
      									),
       							),

      		), // Card
					onTap: () async {
						print('imprimindo informacao no card no click, antes de chamar showMemoPage');
						print(memo);
						showMemoPage(memo: memo);	
					//	 MemoDTO recMemo  = await  push(context,MemoPage(memo:memo));
					//	 if(recMemo!=null){
					//		if(memo!=null){
					//			await	 memodmo.updateMemo(recMemo);
					//		} else {
					//			await  memodmo.save(recMemo);
					//		}	
					//		getAllMemo();
					//		} // if(recMemo)
					}
    ); //GestureDetector
	}

	}



//	final String imgRev1 = "images/bar_rev_1_nm2.png";
//	final String imgRev2 = "images/bar_rev2_nm.png";
//	final String imgRev3 = "images/bar_rev3_nm.png";
//	final String imgRev4 = "images/bar_rev4_nm.png";


//	String teste(){
//		print('imprimir as revisoes');
//		print('imprimir as rev1 ========================================');
//		print(memo!.rev1h ?? "" );
//		print('imprimir as rev2 ========================================');
//		print(memo!.rev24h ?? "" );
//		print('imprimir as rev3 ========================================');
//		print(memo!.rev1week ?? "" );
//		print('imprimir as rev4 ========================================');
//		print(memo!.rev1month ?? "" );

//		return imgRev4;
//	}

	String _nextRev(MemoDTO memo){
		
		final DateTime today = DateTime.now();
		final DateTime yesterday = today.subtract(const Duration(days: 1));
		
		if(yesterday.isBefore(DateTime.parse(memo.rev1month!))){
			if(yesterday.isBefore(DateTime.parse(memo.rev1week!))){
				if(yesterday.isBefore(DateTime.parse(memo.rev24h!))){
					return ConstRev1;
				} else {
					return ConstRev2;
				}
			}
			return ConstRev3;
		}
		return ConstRev4;	
	}
	

	String _imgProgress(MemoDTO memo){
		
		final DateTime today = DateTime.now();
		final DateTime yesterday = today.subtract(const Duration(days: 1));
		
		if(yesterday.isBefore(DateTime.parse(memo.rev1month!))){
			if(yesterday.isBefore(DateTime.parse(memo.rev1week!))){
				if(yesterday.isBefore(DateTime.parse(memo.rev24h!))){
					return ConstRev1;
				} else {
					return ConstRev2;
				}
			}
			return ConstRev3;
		}
		return ConstRev4;	
	}



