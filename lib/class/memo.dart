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
		static const String titleMainCol = "_titleMain";
		static const String subtitleCol = "_subtitle";
		static const String themeCol = "_theme";
		static const String rev1hCol = "_rev1h";
		static const String rev24hCol = "_rev24h";
		static const String rev1weekCol = "_rev1week";
		static const String rev1monthCol = "_rev1month";
		static const String revAllCol = "_revAll";
		static const String colorCol = "_color";
		static const String listPdfCol = "_listPdf";
		static const String listImgCol = "_listImg";
	}


class Memo{ 
	int? id;
  String? _titleMain;
  String? _subtitle;
  String? _theme;
  String? _rev1h;
  String? _rev24h;
  String? _rev1week;
  String? _rev1month;
  String? _revAll;
  String? _color;
  List<String>? _listPdf;
  List<String>? _listImg;

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


  Memo.fromMap(Map map){
     this.id = map[MemoFields.idCol];
		 this._titleMain = map[MemoFields.titleMainCol];
		 this._subtitle = map[MemoFields.subtitleCol];
		 this._theme = map[MemoFields.themeCol];
		 this._color = map[MemoFields.colorCol];
		 this._rev1h = map[MemoFields.rev1hCol];
		 this._rev24h = map[MemoFields.rev24hCol];
		 this._rev1month = map[MemoFields.rev1monthCol];
		 this._revAll = map[MemoFields.revAllCol];
		 this._rev1week = map[MemoFields.rev1weekCol];
		 this._listPdf = map[MemoFields.listPdfCol];
		 this._listImg = map[MemoFields.listImgCol];

  }

	Map toMap(){
	 Map<dynamic,dynamic> map = {
		  _titleMain: _titleMain, 
	    _subtitle: this._subtitle,
      _theme: this._theme,
      _rev1h: this._rev1h,
	    _rev24h: this._rev24h,
      _rev1week: this._rev1month,
      _rev1month: this._revAll,
      _rev1week:this._rev1week,
			_revAll: this._revAll,
			_color: this._color,
      _listPdf: this._listPdf,
      _listImg: this._listImg,
	 };
	 if(id!=null){
	 	map[id] = id ;
	 }
	 return map;

	}//toMap

	@override
  String toString(){
			return "Memo(id:$id,_titleMain:$_titleMain)";
	}

}
