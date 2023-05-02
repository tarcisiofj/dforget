


 class Memo{ 

 	int? id;
  String? titleMain;
  String? subtitle;
  String? theme;
	bool? viewRev1= false;
	bool? viewRev24h= false;
	bool? viewRev1w= false;
	bool? viewRev1m= false;
	String? dtCriacao;
  //String? rev1h;
  //String? rev24h;
  //String? rev1week;
  //String? rev1month;
  //String? revAll;
  //int? color;
  String? listPdf;
//  List<String>? listImg;
	
		
	Memo.empty();	
	
	Memo.fromMap();


  Memo(
		this.titleMain,
    this.subtitle,
    this.theme,
		this.dtCriacao,
    this.viewRev1,
    this.viewRev24h,
    this.viewRev1w,
    this.viewRev1m,
    //this.revAll,
   // this.color,
  //  this.listImg,
    this.listPdf
  );

//	int? get getColor{
//		return color;
//	}	
//  set setColor(int color){
//		this.color = color;
//	}
	

	String? get getTitleMain{
		return this.titleMain;
	}
	set setTitleMain(String titleMain){
		this.titleMain = titleMain;
	}

	String? get getSubtitle{
		return subtitle;
	}
  set setSubtitle(String subtitle){
			this.subtitle = subtitle;
	}
	
  String? get getTheme{
		return theme;
	}
  set setTheme(String theme){
		this.theme=theme;
	}

//	String? get getRev1h{
//		return rev1h;
//	}
//  set setRev1h(String rev1h){
//		this.rev1h =rev1h;
//	}

	String? get getDtCriacao{
		return dtCriacao;
	}
  set setDtCriacao(String dtCriacao){
		this.dtCriacao =dtCriacao;
	}
	

	bool? get getViewRev1 => viewRev1;
  set setViewRev1(viewRev1) => this.viewRev1;

	bool? get getViewRev1w => viewRev1w;
  set setViewRev1w(viewRev1w) => this.viewRev1w;

	bool? get getViewRev1m => viewRev1m;
  set setViewRev1m(viewRev1m) => this.viewRev1m;

	bool? get getViewRev24h => viewRev24h;
  set setViewRev24h(viewRev24h) => this.viewRev24h;
//	String? getListPdf(){
//		return listPdf;
//	}


//	bool hasImage(){
//		List? lst;// = listImg.length;
//		if(lst?.length > 0)
//			return true;
//		return false;
//	}
  
//	Memo.fromMap(Map map){
//     id = map[MemoFields.idCol];
//		 titleMain = map[MemoFields.titleMainCol];
//		 subtitle = map[MemoFields.subtitleCol];
//		 theme = map[MemoFields.themeCol];
//		 color = map[MemoFields.colorCol];
//		 rev1h = map[MemoFields.rev1hCol];
//		 //rev24h = map[MemoFields.rev24hCol];
//		 //rev1month = map[MemoFields.rev1monthCol];
//		// revAll = map[MemoFields.revAllCol];
//		 //rev1week = map[MemoFields.rev1weekCol];
//		 listPdf = map[MemoFields.listPdfCol];
//		 listImg = map[MemoFields.listImgCol];
//
//  }
//
//	Map<String,dynamic> toMap(){
//	 Map<String,dynamic> map = {
//		  MemoFields.titleMainCol: titleMain, 
//	    MemoFields.subtitleCol: subtitle,
//      MemoFields.themeCol: theme,
//      MemoFields.rev1hCol: rev1h,
//	    //MemoFields.rev24hCol:rev24h,
//      //MemoFields.rev1weekCol: rev1week,
//      //MemoFields.rev1monthCol: rev1month,
//			//MemoFields.revAllCol: revAll,
//			MemoFields.colorCol: color,
//      MemoFields.listPdfCol: listPdf,
//      MemoFields.listImgCol: listImg,
//	 };
//	 if(id!=null){
//	 	map[MemoFields.idCol] = id ;
//	 }
//	 return map;
//
//	}//toMap

	@override
  String toString(){
			return "Memo(id:$id,titleMain:$titleMain,listpdf:$listPdf)";
	}

}
