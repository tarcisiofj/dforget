import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:dforget/class/memo.dart';




class MemoDAO{



//var	 class_memo = ${MemoFields.idCol}

String 	varMemo = MemoFields.idCol;


	static final MemoDAO _instance = MemoDAO.internal();
	factory MemoDAO() => _instance;
	MemoDAO.internal();

	Database? _db;

	Future<Database?> get db async {
		if (_db != null){
			print('db é diferente  de nulo');
			return _db;
		} else{
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
		final path = join(databasesPath,"memories.db");

		const idType = 'INTEGER PRIMARY KEY';
		const textType = 'TEXT NOT NULL';
		const intType = 'INTEGER NOT NULL';
		

	  return await	openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {
			await db.execute("CREATE TABLE $memoriesTable( " 
						"$MemoFields.idCol $idType, " 
						"$MemoFields.titleMainCol $textType,"
						"$MemoFields.subtitleCol $textType,"
						"$MemoFields.themeCol $textType," 
						"$MemoFields.rev1hCol $textType,"
						"$MemoFields.rev24hCol $textType," 
						"$MemoFields.rev1weekCol $textType," 
						"$MemoFields.rev1monthCol $textType," 
						"$MemoFields.revAllCol $textType," 
						"$MemoFields.colorCol $textType," 
						"$MemoFields.listPdfCol $textType,"
						"$MemoFields.listImgCol $textType"
						")"
			);
		});
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
}

