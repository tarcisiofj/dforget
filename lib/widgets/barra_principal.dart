import 'package:flutter/material.dart';

class BarraPrincipal extends StatelessWidget implements PreferredSizeWidget{

	final String  tle;

	const BarraPrincipal( {Key? key, required this.tle}): super(key: key);

	@override
	Size get preferredSize => Size.fromHeight(kToolbarHeight);

	@override
	Widget build(BuildContext context) {
		return AppBar(
				title:  Text(tle),
					
		);
	}
}

	
