import 'package:flutter/material.dart';
import 'package:dforget/class/memo.dart';

class MemoPage extends StatefulWidget {

	final Memo? memo;
	const MemoPage({Key? key, this.memo}): super(key:key);



	@override
	State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
	Memo? _editedMemo;
	bool _userEdited = false;


	@override
	void initState(){
		super.initState();

		if(widget.memo == null){
			_editedMemo = Memo();
		} else {
			_editedMemo = Memo.fromMap(widget.memo!.toMap());

		}
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			
		);
	}
}
