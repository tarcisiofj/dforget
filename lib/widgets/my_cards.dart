import 'dart:ffi';

import 'package:dforget/widgets/nav.dart';
import 'package:flutter/material.dart';
import 'package:dforget/class/memo_dto.dart';
import 'package:dforget/class/memo_dmo.dart';
import 'package:dforget/core/constants.dart';
import 'package:path/path.dart';
import 'package:dforget/pages/include/memo_page.dart';
import 'package:dforget/widgets/nav.dart';

class MyCard extends StatefulWidget {
 	MyCard({
    Kefinal y
  }) : super(key: key);

	final Void  getAllMemo;
	MemoDTO? mem,this.getAllMemo o;


 	MyCard.full(this.memo,BuildContext context);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
	late String titulo;

				MemoDMO memodmo = MemoDMO();
								child: Row(
									children: <Widget>[
														color: Color(widget.memo?.getColor ?? 0) ,
											 ),//container
												 child:	Column(
														 ListTile(
																 widget.memo?.titleMain ?? "",
																	 style:TextStyle(
														 fontWeight: FontWeight.bold) ,),
      									 subtitle: RichText(
      												text:  TextSpan( 
      							 				  		children: [
														 color: Colors.blueAccent,
														 semanticLabel:'Possui Imagens',
														 ),// Icon photo
												 Icon(Icons.picture_as_pdf,
														 color: Colors.red,
														 semanticLabel: 'Possui PDF',)//Icon pdf
											 ],), //Icon(Icons.circle_notifications),
										//	 onTap: (){
										//	 	print('Clicou');
			//		_s owMemoPage(context,memo!);
													//isThreeLine:true ,
								 InkWell(
											//	print('Click na figura');
									//}, // Image tapped
														fit: BoxFit.cover, // Fixes border issues
														height: 60,
											),//child
												//Image.asset('images/bar_rev_1_nm2.png',width: 300, height:70,)
												//Image.asset(_imgProgress(),width: 300, height:70,)
        						],//children 
      					),//Column
      					),//Expanded
       							),

      		), // Card
					onTap: () async {
			 			emoDTO recMemo  = await  push(context,MemoPage(memo:widget.memo));
						//Future  recMemo = Navigator.of(context).pushNamed('/MemoPage', arguments:{'memo':memo});

						 if(recMemo!=null){
							if(widget.memo!=null){
								await memodmo.updateMemo(recMemo);
							} else {
								await  memodmo.save(recMemo);
							}	
							//_getAllMemo();
							Future<List> l = memodmo.getAllMemo();
							setState(() {
								
							});

						} // if(recMemo)
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



