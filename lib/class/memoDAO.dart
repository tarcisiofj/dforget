import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class MemoDAO{

	final String memoriesTable = "memories.db";
	final String idCol= "id";
	final String titleMainCol = "_titleMain";
	final String subtitleCol = "_subtitle";
	final String themeCol = "_theme";
	final String rev1hCol = "_rev1h";
	final String rev24hCol = "_rev24h";
	final String rev1weekCol = "_rev1week";
	final String rev1monthCol = "_rev1month";
	final String revAllCol = "_revAll";
	final String colorCol = "_color";
	final String listPdfCol = "_listPdf";
	final String listImgCol = "_listImg";


	static final MemoDAO _instance = MemoDAO.internal();
	factory MemoDAO() => _instance;
	MemoDAO.internal();

	late Database _db;

	Future<Database> get db async {
		if (_db != null){
			return _db;
		} else{
			_db= await initDb();
			return _db;
		}
	}


	initDb() async {
		
		final databasesPath = await getDatabasesPath();
		final path = join(databasesPath,"memories.db");

	  return await	openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {
			await db.execute('CREATE TABLE teste(nome varchar(200))');
			await db.execute('INSERT INTO teste VALUES("tarcisiofj")');  });
	}

//	Future<Database> initDb() async {
//		final databasesPath = await getDatabasesPath();
//		final path = join(databasesPath,"memories.db");
//
//	  return await	openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {
//			await db.execute("CREATE TABLE $memoriesTable( " 
//						"$idCol INTEGER PRIMARY KEY, " 
//						"$titleMainCol TEXT,"
//						"$subtitleCol TEXT,"
//						"$themeCol TEXT," 
//						"$rev1hCol TEXT,"
//						"$rev24hCol TEXT," 
//						"$rev1weekCol TEXT," 
//						"$rev1monthCol TEXT," 
//						"$revAllCol TEXT," 
//						"$colorCol TEXT," 
//						"$listPdfCol TEXT,"
//						"$listImgCol TEXT"
//						")"
//			);
//		});
//	}
}

