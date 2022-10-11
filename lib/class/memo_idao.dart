import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:dforget/class/memo.dart';




abstract class MemoIDAO{

	Future<Database> initDb() ;

	Future<Memo> saveMemo(Memo memo) ;

	Future<Memo?> getMemo(int id); 

	Future<int> updateMemo(Memo memo) ;
	
	Future<List<Memo>> getAllMemo();

	Future close();

}

