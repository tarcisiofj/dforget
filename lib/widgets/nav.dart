
import 'package:dforget/class/memo_dto.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page,{MemoDTO? memo}) {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
