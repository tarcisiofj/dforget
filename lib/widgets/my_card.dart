import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
 MyCard({
    Key? key,
  }) : super(key: key);

late String titulo;

 MyCard.full(String this.titulo);


  @override
  Widget build(BuildContext context) {
    return Card(
    	child: SizedBox(
    		height: 145.0,
    		child: Row(
    			crossAxisAlignment: CrossAxisAlignment.stretch,
    			children: <Widget>[
    					 Container(
    							color: Colors.red,
    							padding: const EdgeInsets.symmetric(horizontal: 5.0),
    							// child: Text(                  "",style: new TextStyle(color: Colors.white),),
    					 ),//container
    					 Expanded(
    						 child:	Column(
    						   children: [
    						     ListTile(
    									 title: Text(titulo),
    									 subtitle: RichText(
    											text:  TextSpan( 
    												style: TextStyle(color: Colors.cyan),
    							 				  children: [
    							 				    TextSpan(text: 'Próxima Revisão:',),
    												  TextSpan(text: '03/04/2022',
    												    style: TextStyle( color: Colors.black) ),
    											  ]
    											)
    									 ),// subtitle, Text('Próxima Revisão: 03/02/22 \n terceira linha ') ,
    									 trailing: Column(children: [
												 Icon(Icons.photo),
												 Icon(Icons.picture_as_pdf)
											 ],), //Icon(Icons.circle_notifications),
											 onTap: (){
											 	print('Clicou');
											 },
    									 //leading: Icon(Icons.circle,color: Colors.greenAccent),
    									 //isThreeLine:true ,
    								),//ListTile

    								Image.asset('images/bar_rev_1.png',width: 300, height:70,)
    							],//children 
    						),//Column
    					),//Expanded
    				],
    									),
    							)								
    		);
  }
}

