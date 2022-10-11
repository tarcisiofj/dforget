import 'package:flutter/material.dart';
import 'package:dforget/class/memo.dart';


class MyCard extends StatelessWidget {
 	MyCard({
    Key? key,
  }) : super(key: key);

	late String titulo;
	Memo? memo;
  
 	MyCard.full(this.memo);


  @override
  Widget build(BuildContext context) {
    return Card(
    	child: SizedBox(
    		height: 145.0,
    		child: Row(
    			crossAxisAlignment: CrossAxisAlignment.stretch,
    			children: <Widget>[
    					 Container(
    							color: Color(memo?.getColor() ?? 0) ,
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
											 onTap: (){
											 	print('Clicou');
											 },
    									 //leading: Icon(Icons.circle,color: Colors.greenAccent),
    									 //isThreeLine:true ,
    								),//ListTile

    								//Image.asset('images/bar_rev_1_nm2.png',width: 300, height:70,)
    								Image.asset(_imgProgress(),width: 300, height:70,)

    							],//children 
    						),//Column
    					),//Expanded
    				],
    									),
     							)							
    		);
  }

	final String imgRev1 = "images/bar_rev_1_nm2.png";
	final String imgRev2 = "images/bar_rev2_nm.png";
	final String imgRev3 = "images/bar_rev3_nm.png";
	final String imgRev4 = "images/bar_rev4_nm.png";


	String teste(){
		print('imprimir as revisoes');
		print('imprimir as rev1 ========================================');
		print(memo!.rev1h ?? "" );
		print('imprimir as rev2 ========================================');
		print(memo!.rev24h ?? "" );
		print('imprimir as rev3 ========================================');
		print(memo!.rev1week ?? "" );
		print('imprimir as rev4 ========================================');
		print(memo!.rev1month ?? "" );

		return imgRev4;
	}


	String _imgProgress(){
		final DateTime rev1 = DateTime.parse(memo!.rev1h!);
		final DateTime rev2 = DateTime.parse(memo!.rev24h!);
		final DateTime rev3 = DateTime.parse(memo!.rev1week!);
		final DateTime rev4 =DateTime.parse( memo!.rev1month!);
		final DateTime today = DateTime.now();
		final DateTime yesterday = today.subtract(const Duration(days: 1));

		print('dentro da funcao IMGPROGRESS..................................');

		if(yesterday.isBefore(rev4)){
			if(yesterday.isBefore(rev3)){
				if(yesterday.isBefore(rev2)){
					print('rev1: $rev1');
					print('imgrev1: $imgRev1');
					print(yesterday);
					print('rev4: $rev4');
					return imgRev1;
				} else {
					print('rev2: $rev2');
					print('imgrev2: $imgRev2');
					return imgRev2;
				}
			
			}
			print('rev3: $rev3');
			print('imgrev3: $imgRev3');
			return imgRev3;
		}
		print('rev4: $rev4');
		print('imgrev4: $imgRev4');
		return imgRev4;	
	}
}

