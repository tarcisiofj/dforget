import 'dart:async';

//import 'package:dforget/class/memo.dart';
import 'package:dforget/class/memo_dto.dart';
import 'package:dforget/class/memo_idao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dforget/core/constants.dart';



class MemoDAO implements MemoIDAO{



//var	 class_memo = ${MemoFields.idCol}

//	MemoDTO 	memoFields  = MemoDTO.MemoFields();
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
		final path = join(databasesPath,"memories1.1.db");

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


	Future<MemoDTO> saveMemo(MemoDTO memo) async {
		Database? dbMemo = await db;
//    try {
    	memo.id = await dbMemo?.insert(memoriesTable, memo.toMap());
  //  } catch (Exception ) {
		//	print("=================================\n"+Exception.toString());
		//	print("ERRO AO INSERIR MEMORIES");
    //}		
		print('salvando...'  );
		return memo;
	}

	Future<MemoDTO?> getMemo(int id) async {
		Database? dbMemo = await db;
		
		List<Map> maps =await dbMemo!.query(memoriesTable,
				columns:[MemoFields.titleMainCol],
				where: "$MemoFields.idCol = ?",
				whereArgs: [id]);
		if(maps.isNotEmpty){
			return MemoDTO.fromMap(maps.first);
		} else {
			throw Exception('ID $id não encontrado');
		}

	}

	Future<int> updateMemo(MemoDTO memo) async {
		Database? dbMemo = await db;
		MemoDTO memodto = _getColorCard(memo);
	  print(memodto);
		return await dbMemo!.update(memoriesTable, memodto.toMap(), 
				where: "${MemoFields.idCol}=?",
				whereArgs: [memo.id],);
	}

	Future<int>	 deleteMemoAllReg() async {
		Database? dbMemo = await db;

		return await dbMemo!.delete(memoriesTable,where: null);
		//return await dbMemo!.delete(memoriesTable,where: "${MemoFields.idCol}=?",whereArgs: [id]);
	}
	
	Future<int>	 deleteMemo(int id) async {
		Database? dbMemo = await db;

		return await dbMemo!.delete(memoriesTable,where: "${MemoFields.idCol}=?",whereArgs: [id]);
	}
	
	Future<List<MemoDTO>> getAllMemo() async {
		
		Database? dbMemo = await db;
		List listMap = await dbMemo!.rawQuery("SELECT * FROM $memoriesTable");
	  List<MemoDTO> listMemo = [];
		MemoDTO memo ;

		for(Map m in listMap){
			memo = MemoDTO.fromMap(m);
			listMemo.add(_getColorCard(memo) );
		}
		return listMemo;
	}

	Future close() async {
		Database? dbMemo = await db;
		dbMemo!.close();
	}


	MemoDTO _getColorCard(MemoDTO memo){
		
		final DateTime today = DateTime.now();
		DateTime temp = today;

		if(temp.isAfter(DateTime.parse(memo.rev1h!))){
    		print('temp mair q rev1h');
     		if(temp.isAfter(DateTime.parse(memo.rev24h!))){
					print('temp maior rev24h');
      		if(temp.isAfter(DateTime.parse(memo.rev1week!))){
						print('temp mair revWeek');
	        	if(temp.isAfter(DateTime.parse(memo.rev1month!))){
          		print('temp maior revMonth');
        		} else
					 //	{  //if revMonth
         		//	if(temp.compareTo(DateTime.parse(memo.rev1month!))==0)
            	//	memo.color!=ConstRevise;							 	
         		//	else
            		memo.color!= ConstOk;
        		//} //else revMonth
      		} else
					//{ // if revWeek
         		//if(temp.compareTo(DateTime.parse(memo.rev1week!))==0)
            //	memo.color!=ConstRevise;
					//	else
            	memo.color!= ConstOk;
        	//}// else revWeek
    	} else 
			//{  // if rev24
      	//if(temp.compareTo(DateTime.parse(memo.rev24h!))==0)
        //	memo.color!=ConstRevise;
      //	else
          memo.color!= ConstOk;
    	//}// else rev24
  	} else 
		//{ // if rev1h
    	//if(temp.compareTo(DateTime.parse(memo.rev1h!))==0)
      //	memo.color!= ;
    //	else
      	memo.color!= ConstOk;
  	//} // else rev1h
	return memo;
	}

}

