import 'package:flutter/material.dart';
import 'package:dforget/class/memo_dto.dart';

class MemoPage extends StatefulWidget {

	final MemoDTO? memo;
	const MemoPage({Key? key, this.memo}): super(key:key);





	@override
	State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
	MemoDTO? _editedMemo;
	bool _memoEdited = false;

	final _titleMainControler = TextEditingController();
	final _subtitleControler = TextEditingController();
	final _themeControler = TextEditingController();
	
	final _tituloFocus = FocusNode();

	@override
	void initState(){
		super.initState();

			print('dendtro do initstate :');
			print(widget.memo);

		if(widget.memo == null){
			_editedMemo = MemoDTO.empty();
		} else {

			print(widget.memo);
			_editedMemo = MemoDTO.fromMap(widget.memo!.toMap());
			_titleMainControler.text = _editedMemo?.getTitleMain ?? "";
			_subtitleControler.text = _editedMemo?.getSubtitle ?? "";
			_themeControler.text = _editedMemo?.getTheme ?? "";

			

		}
	}

	@override
	Widget build(BuildContext context) {
		return WillPopScope(
			onWillPop: _requestPop,
		  child: 
		    Scaffold(
		    			appBar: AppBar(
		    				 		title: Text(_editedMemo?.titleMain ?? "Nota de Memorização"),
		    						centerTitle: true,
		    			),// AppBar
		    			body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Título"),
                onChanged: (text) {
                  _memoEdited = true;
                  setState(() {
                    _editedMemo?.titleMain= text;
                  });
                },
                controller: _titleMainControler,
                focusNode: _tituloFocus,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Subtitulo"),
                onChanged: (text) {
                  _memoEdited = true;
                  _editedMemo!.subtitle = text;
                },
                controller: _subtitleControler,
                //keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Assunto"),
                onChanged: (text) {
                  _memoEdited = true;
                  _editedMemo!.theme = text;
                },
                controller: _themeControler,
                keyboardType: TextInputType.multiline,
		    			//	expands: true,
		    			//	minLines: 1,
								maxLines: 5,
              ),
            ],
          ),
        ),
		    			

		    			floatingActionButton: FloatingActionButton(
		    						onPressed: (){
		    							if(_editedMemo!.titleMain  !=null && _editedMemo!.titleMain!.isNotEmpty){
		    								Navigator.pop(context, _editedMemo);
		    							}else{
		    								FocusScope.of(context).requestFocus(_tituloFocus);
		    							}
		    						},
		    						child: Icon(Icons.save),
		    						
		    			),
		    ),
		  
		);
				
	}
	Future<bool> _requestPop() {
    if (_memoEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Descartar alterações?"),
              content: const Text("Se sair, as alterações serão perdidas!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Sim"),
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
