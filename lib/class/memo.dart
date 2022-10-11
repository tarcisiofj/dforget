const String memoriesTable = 'memories';

 class MemoFields {
		static final List<String> values = [
			idCol,
			titleMainCol,
			subtitleCol,
			themeCol,
			rev1hCol,
			rev24hCol,
			rev1weekCol,
			rev1monthCol,
			revAllCol,
			colorCol,
			listPdfCol,
			listImgCol
		];

		static const String idCol= "id";
		static const String titleMainCol = "titleMain";
		static const String subtitleCol = "subtitle";
		static const String themeCol = "theme";
		static const String rev1hCol = "rev1h";
		static const String rev24hCol = "rev24h";
		static const String rev1weekCol = "rev1week";
		static const String rev1monthCol = "rev1month";
		static const String revAllCol = "revAll";
		static const String colorCol = "color";
		static const String listPdfCol = "listPdf";
		static const String listImgCol = "listImg";
	}


class Memo{ 
	int? id;
  String? titleMain;
  String? subtitle;
  String? theme;
	bool? statusView= true;
  String? rev1h;
  String? rev24h;
  String? rev1week;
  String? rev1month;
  String? revAll;
  int? color;
  String? listPdf;
  String? listImg;

	Memo();
//  Memo(
//		this._titleMain,
//    this._subtitle,
//    this._theme,
//    this._rev1h,
//    this._rev24h,
//    this._rev1week,
//    this._rev1month,
//    this._revAll,
//    this._color,
//    this._listImg,
//    this._listPdf
//  );
	
	int getColor(){
		return color!;
	}	
	
	String? getTitleMain(){
		return titleMain;
	}

//	bool hasImage(){
//		List? lst;// = listImg.length;
//		if(lst?.length > 0)
//			return true;
//		return false;
//	}
  
	Memo.fromMap(Map map){
     id = map[MemoFields.idCol];
		 titleMain = map[MemoFields.titleMainCol];
		 subtitle = map[MemoFields.subtitleCol];
		 theme = map[MemoFields.themeCol];
		 color = map[MemoFields.colorCol];
		 rev1h = map[MemoFields.rev1hCol];
		 rev24h = map[MemoFields.rev24hCol];
		 rev1month = map[MemoFields.rev1monthCol];
		 revAll = map[MemoFields.revAllCol];
		 rev1week = map[MemoFields.rev1weekCol];
		 listPdf = map[MemoFields.listPdfCol];
		 listImg = map[MemoFields.listImgCol];

  }

	Map<String,dynamic> toMap(){
	 Map<String,dynamic> map = {
		  MemoFields.titleMainCol: titleMain, 
	    MemoFields.subtitleCol: subtitle,
      MemoFields.themeCol: theme,
      MemoFields.rev1hCol: rev1h,
	    MemoFields.rev24hCol:rev24h,
      MemoFields.rev1weekCol: rev1week,
      MemoFields.rev1monthCol: rev1month,
			MemoFields.revAllCol: revAll,
			MemoFields.colorCol: color,
      MemoFields.listPdfCol: listPdf,
      MemoFields.listImgCol: listImg,
	 };
	 if(id!=null){
	 	map[MemoFields.idCol] = id ;
	 }
	 return map;

	}//toMap

	@override
  String toString(){
			return "Memo(id:$id,titleMain:$titleMain)";
	}

}
