import 'package:flutter/material.dart';
import 'package:dforget/class/memo.dart';
import 'package:dforget/class/memo_dto.dart';
import 'package:dforget/class/memo_idao.dart';
import 'package:dforget/class/memo_dao.dart';
import 'package:dforget/core/constants.dart';

class MemoDMO{ 


	MemoDMO();
	MemoIDAO memodao = MemoDAO();

	int whatRev(MemoDTO memo){
		return 1;
	}

  Future<MemoDTO> save(MemoDTO memo){
					
		DateTime today = DateTime.now();
    DateTime todayPlus1h = today.add(Duration(hours:1));
		memo.rev1h = 	todayPlus1h.toString(); 
		memo.rev24h = todayPlus1h.add(Duration(hours: 24)).toString(); 
		memo.rev1week = todayPlus1h.add(Duration(days: 7)).toString();
		memo.rev1month = todayPlus1h.add(Duration(days: 30)).toString();
		memo.revAll = ((DateTime.parse(memo.rev1month!)).add(Duration(days:60))).toString();
		memo.color = ConstOk.value;
		
		try{
		
			return memodao.saveMemo(memo);
		
		}catch(e){
    	throw Exception('erro na gravacao: $e');
		}
	}

	
	Future<int> updateMemo(MemoDTO memo) async {

		try {
		  return memodao.updateMemo(memo);
		} catch(e){
			throw Exception('Erro na Atualização: $e');
		}
	}


Future<List<MemoDTO>> getAllMemo() async {
		try{
		
			return memodao.getAllMemo();

		}catch(e){
			throw Exception('Erro ao listar os Cards de Memórias: $e');
		}
	
	}


	String _nextRev(MemoDTO memo){
		
		final DateTime today = DateTime.now();
		final DateTime yesterday = today.subtract(const Duration(days: 1));
		
		if(today.isAfter(DateTime.parse(memo.rev24h!))){
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



	@override
  String toString(){
			return "Memo";
	}

}
