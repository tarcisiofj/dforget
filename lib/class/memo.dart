class Memo {

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

  Memo(
		this._titleMain,
    this._subtitle,
    this._theme,
    this._rev1h,
    this._rev24h,
    this._rev1week,
    this._rev1month,
    this._revAll,
    this._color,
    this._listImg,
    this._listPdf
  );


  Memo.fromMap(Map map){
     this.id = map["id"];
		 this._titleMain = map["_titleMain"];
		 this._subtitle = map["_subtitle"];
		 this._theme = map["_theme"];
		 this._color = map["_color"];
		 this._rev1h = map["_rev1h"];
		 this._rev24h = map["_rev24h"];
		 this._rev1month = map["_rev1month"];
		 this._revAll = map["_revAll"];
		 this._rev1week = map["_rev1week"];
		 this._listPdf = map["_listPdf"];
		 this._listImg = map["_listImg"];

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
