import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
//import 'package:dforget/class/memo.dart';
import 'package:dforget/class/memo_dto.dart';




abstract class MemoIDAO{

	Future<Database> initDb() ;

	Future<MemoDTO> saveMemo(MemoDTO memo) ;

	Future<MemoDTO?> getMemo(int id); 

	Future<int> updateMemo(MemoDTO memo) ;
	
	Future<List<MemoDTO>> getAllMemo();

	Future close();

}

