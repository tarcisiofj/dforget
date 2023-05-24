import 'dart:convert';

import 'package:dforget/class/memo.dart';
import 'package:dforget/core/constants.dart';

const String memoriesTable = 'memories';

 class MemoFields {
		static final List<String> values = [
			idCol,
			titleMainCol,
			subtitleCol,
			dtCriacaoCol,
			themeCol,
			rev1hCol,
			rev24hCol,
			rev1weekCol,
			rev1monthCol,
			revAllCol,
			viewRev1hCol,
			viewRev24hCol,
			viewRev1wCol,
			viewRev1mCol,
			colorCol,
			listPdfCol,
			listImgCol
		];

		static const String idCol= "id";
		static const String titleMainCol = "titleMain";
		static const String subtitleCol = "subtitle";
		static const String dtCriacaoCol = "dtCriacao";
		static const String themeCol = "theme";
		static const String rev1hCol = "rev1h";
		static const String rev24hCol = "rev24h";
		static const String rev1weekCol = "rev1week";
		static const String rev1monthCol = "rev1month";
		static const String revAllCol = "revAll";
		static const String viewRev1hCol = "viewRev1";
		static const String viewRev24hCol = "viewRev24h";
		static const String viewRev1wCol = "viewRev1w";
		static const String viewRev1mCol = "viewRev1m";
		static const String colorCol = "color";
		static const String listPdfCol = "listPdf";
		static const String listImgCol = "listImg";
	}


class MemoDTO extends Memo{
	
  int? color;
	String? rev1h;
	String? rev24h;
  String? rev1week;
  String? rev1month;
  String? revAll;

	MemoDTO.empty():super.empty();


	MemoDTO(

			this.rev1h,
			this.rev24h,
			this.rev1week,
			this.rev1month,
			this.revAll,
			this.color,		
			
			String dtCriacao,
			bool viewRev1,
			bool viewRev24h,
			bool viewRev1w,
			bool viewRev1m,
			String titleMain,
			String subtitle,
			String theme,
			String listPdf,
			//List<String> listImg
			):	super(
						titleMain,
						subtitle,
						theme,
						dtCriacao,
						viewRev1,
						viewRev24h,
						viewRev1w,
						viewRev1m,
						listPdf,
					//	listImg
						);




MemoDTO.fromMap(Map map):	super.fromMap(){
     id = map[MemoFields.idCol];
		 titleMain = map[MemoFields.titleMainCol];
		 subtitle = map[MemoFields.subtitleCol];
		 theme = map[MemoFields.themeCol];
		 color = map[MemoFields.colorCol];
		 dtCriacao = map[MemoFields.dtCriacaoCol];
		 rev1h = map[MemoFields.rev1hCol]; 
		 rev24h = map[MemoFields.rev24hCol];
		 rev1month = map[MemoFields.rev1monthCol];
		 revAll = map[MemoFields.revAllCol];
		 rev1week = map[MemoFields.rev1weekCol];
		 viewRev1 = map[MemoFields.viewRev1hCol];
		 viewRev24h = map[MemoFields.viewRev24hCol];
		 viewRev1w = map[MemoFields.viewRev1wCol];
		 viewRev1m = map[MemoFields.viewRev1mCol];

		 listPdf = map[MemoFields.listPdfCol];
		// listImg = List<String>.from(map[MemoFields.listImgCol]);
  }


	Map<String,dynamic> toMap(){
	 Map<String,dynamic> map = {
		  MemoFields.titleMainCol: titleMain, 
	    MemoFields.subtitleCol: subtitle,
      MemoFields.themeCol: theme,
			MemoFields.dtCriacaoCol: dtCriacao,
      MemoFields.rev1hCol: rev1h,
	    MemoFields.rev24hCol:rev24h,
      MemoFields.rev1weekCol: rev1week,
      MemoFields.rev1monthCol: rev1month,
			MemoFields.revAllCol: revAll,
			MemoFields.viewRev1hCol: viewRev1,
			MemoFields.viewRev24hCol: viewRev24h,
			MemoFields.viewRev1wCol: viewRev1w,
			MemoFields.viewRev1mCol: viewRev1m,

			MemoFields.colorCol: color,
      MemoFields.listPdfCol: listPdf,
      //MemoFields.listImgCol: listImg,
	 };
	 if(id!=null){
	 	map[MemoFields.idCol] = id ;
	 }
	 return map;
	}//toMap

	int? get getColor{
		return color;
	}
  set setColor(int color){
		this.color =color;
	}



	String? get getRev24h{
		return rev24h;
	}
  set setRev24h(String rev24h){
		this.rev24h =rev24h;
	}

	String? get getRev1h{
		return rev1h;
	}
	set setRev1h(String rev1h){
		this.rev1h;
	}

	String? get getRev1month{
		return rev24h;
	}
  set setRev1month(String rev1month){
		this.rev1month =rev1month;
	}

	String? get getRev1week{
		return rev1week;
	}
  set setRev1week(String rev1week){
		this.rev1week =rev1week;
	}
	
	String? get getRevAll{
		return rev24h;
	}
  set setRevAll(String revAll){
		this.revAll =revAll;
	}


	@override
  String toString(){
		return "MemoDTO(id:$id,titleMain:$titleMain,subtitle:$subtitle,revisao1:$rev1h)";
	}


}
