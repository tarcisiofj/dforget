import 'dart:async';

import 'package:dforget/class/memo.dart';
import 'package:dforget/class/memo_idao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class MemoDAO implements MemoIDAO{



//var	 class_memo = ${MemoFields.idCol}

	Memo 	memoFields  = Memo();
	List<String> lstMemoFields  = MemoFields.values;
	
	static final MemoDAO _instance = MemoDAO.internal();
	factory MemoDAO() => _instance;
	MemoDAO.internal();

	Database? _db;

	Future<Database?> get db async {
		if (_db != null){
			print('db é diferente  de nulo');
			return _db;
		} else{
			// ignore: avoid_print
			print('ELSE; db é nulo, entao, initDb ');
			_db= await initDb();
			return _db;
		}
	}


//	initDb() async {
//		
//		final databasesPath = await getDatabasesPath();
//		final path = join(databasesPath,"memories.db");
//
//	  return await	openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {
//			await db.execute('CREATE TABLE teste(nome varchar(200))');
//			await db.execute('INSERT INTO teste VALUES("tarcisiofj")');  });
//	}

	Future<Database> initDb() async {

		final databasesPath = await getDatabasesPath();
		final path = join(databasesPath,"memories1.db");

		const idType = 'INTEGER PRIMARY KEY';
		const textType = 'TEXT';// NOT NULL';
		const intType = 'INTEGER NOT NULL';
		

	  return await	openDatabase(path, version:1, onCreate: (Database db, int newerVersion) async {
			await db.execute(
					"CREATE TABLE $memoriesTable(${MemoFields.idCol} $idType," 
						"${MemoFields.titleMainCol} $textType,"
						"${MemoFields.subtitleCol} $textType,"
						"${MemoFields.themeCol} $textType," 
						"${MemoFields.rev1hCol} $textType,"
						"${MemoFields.rev24hCol} $textType," 
						"${MemoFields.rev1weekCol} $textType," 
						"${MemoFields.rev1monthCol} $textType," 
						"${MemoFields.revAllCol} $textType," 
						"${MemoFields.colorCol} $intType," 
						"${MemoFields.listPdfCol} $textType,"
						"${MemoFields.listImgCol} $textType"
						")"
			);
		});
	}


	Future<Memo> saveMemo(Memo memo) async {
		Database? dbMemo = await db;
		
		memo.id = await dbMemo?.insert(memoriesTable, memo.toMap());
		print(memo.titleMain );
		return memo;
	}

	Future<Memo?> getMemo(int id) async {
		Database? dbMemo = await db;
		
		List<Map> maps =await dbMemo!.query(memoriesTable,
				columns:[MemoFields.titleMainCol],
				where: "$MemoFields.idCol = ?",
				whereArgs: [id]);
		if(maps.isNotEmpty){
			return Memo.fromMap(maps.first);
		} else {
			throw Exception('ID $id não encontrado');
		}

	}

	Future<int> updateMemo(Memo memo) async {
		Database? dbMemo = await db;

		return await dbMemo!.update(memoriesTable, memo.toMap(), 
				where: "${MemoFields.idCol}=?",
				whereArgs: [memo.id],);
	}

	Future<int>	 deleteMemo(int id) async {
		Database? dbMemo = await db;

		return await dbMemo!.delete(memoriesTable,where: "${MemoFields.idCol}=?",whereArgs: [id]);
	}
	
	Future<List<Memo>> getAllMemo() async {
		Database? dbMemo = await db;
		List listMap = await dbMemo!.rawQuery("SELECT * FROM $memoriesTable");
	  List<Memo> listMemo = [];
		for(Map m in listMap){
			listMemo.add(Memo.fromMap(m));
		}
		return listMemo;
	}

	Future close() async {
		Database? dbMemo = await db;
		dbMemo!.close();
	}

}

