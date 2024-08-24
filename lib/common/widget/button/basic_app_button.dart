

import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({super.key, required this.onpress, required this.title,this.Height});

  final VoidCallback onpress;
  final String title;
 final double? Height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress,
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(Height ?? 80)),
      child: Text(title,style:const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),  );
  }
}
