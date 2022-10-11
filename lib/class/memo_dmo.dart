import 'package:flutter/material.dart';
import 'package:dforget/class/memo.dart';
import 'package:dforget/class/memoDAO.dart';


class MemoDMO{ 


	MemoDMO();

	//Memo? memo;
	MemoDAO memodao = MemoDAO();
  
	final String imgRev1 = "images/bar_rev_1_nm2.png";
	final String imgRev2 = "images/bar_rev2_nm.png";
	final String imgRev3 = "images/bar_rev3_nm.png";
	final String imgRev4 = "images/bar_rev4_nm.png";


	int whatRev(Memo memo){
			

		return 1;
	}

  Future<Memo> save(Memo memo){
					
		DateTime today = DateTime.now();
		int colorDefault =  Colors.blue.value;

		memo.rev24h = today.add(Duration(hours: 24)).toString(); 
    memo.rev1h = 	today.add(Duration(hours:1)).toString(); 
		memo.rev1week = today.add(Duration(days: 7)).toString();
		memo.rev1month = today.add(Duration(days: 30)).toString();
		memo.revAll = ((DateTime.parse(memo.rev1month!)).add(Duration(days:30))).toString();
		memo.color = colorDefault;
		try{
			return memodao.saveMemo(memo);
		}catch(e){
    	throw Exception('erro na gravacao: $e');
		}
	
	}

	String _imgProgress(Memo memo){
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

	@override
  String toString(){
			return "Memo";
	}

}
