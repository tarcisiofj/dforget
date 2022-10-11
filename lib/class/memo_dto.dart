import 'package:dforget/class/memo.dart';


class MemoDTO extends Memo{
	
	MemoDTO(){
		super();
		

	}

  String? rev1h;
  String? rev24h;
  String? rev1week;
  String? rev1month;
  String? revAll;
  int? color;
  String? listPdf;
  String? listImg;

	
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
	

//	bool hasImage(){
//		List? lst;// = listImg.length;
//		if(lst?.length > 0)
//			return true;
//		return false;
//	}
  

	@override
  String toString(){
			return "Memo(id:$id,titleMain:$titleMain)";
	}

}
