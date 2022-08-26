import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:dforget/class/memo.dart';




class MemoDAO{

//	final String memoriesTable = "memories.db";
//	final String idCol= "id";
//	final String titleMainCol = "_titleMain";
//	final String subtitleCol = "_subtitle";
//	final String themeCol = "_theme";
//	final String rev1hCol = "_rev1h";
//	final String rev24hCol = "_rev24h";
//	final String rev1weekCol = "_rev1week";
//	final String rev1monthCol = "_rev1month";
//	final String revAllCol = "_revAll";
//	final String colorCol = "_color";
//	final String listPdfCol = "_listPdf";
//	final String listImgCol = "_listImg";


var	 class_memo = ${MemoFields.idCol}

String 	varMemo = MemoFields.idCol;


	static final MemoDAO _instance = MemoDAO.internal();
	factory MemoDAO() => _instance;
	MemoDAO.internal();

	Database? _db;

	Future<Database> get db async {
		if (_db != null){
			return _db!;
		} else{
			_db= await initDb();
			return _db!;
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

		final INT_PK = 'INTEGER PRIMARY KEY';
		final TEXT_ = 'TEXT NOT NULL';
		final INT_ = 'INTEGER';
		

	  return await	openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {
			await db.execute("CREATE TABLE $memoriesTable( " 
						"$MemoFields.idCol $INT_PK, " 
						"$MemoFields.titleMainCol $TEXT_,"
						"$MemoFields.subtitleCol $TEXT_,"
						"$MemoFields.themeCol $TEXT_," 
						"$MemoFields.rev1hCol $TEXT_,"
						"$MemoFields.rev24hCol $TEXT_," 
						"$MemoFields.rev1weekCol $TEXT_," 
						"$MemoFields.rev1monthCol $TEXT_," 
						"$MemoFields.revAllCol $TEXT_," 
						"$MemoFields.colorCol $TEXT_," 
						"$MemoFields.listPdfCol $TEXT_,"
						"$MemoFields.listImgCol $TEXT_"
						")"
			);
		});
	}
	Future<Memo> getMemo(int id) async {
		Database dbMemo = await db;
		
		List<Map> maps =await dbMemo.query(memoriesTable,
				columns:[${MemoFields.titleMainCol}],
				where: "$MemoDAO.idCol = ?",
				whereArgs: [id]);
		if(maps.length>0){
			return Memo.fromMap(maps.first);
		}

	}
}

