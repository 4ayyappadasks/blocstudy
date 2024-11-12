import 'package:flutter/material.dart';

class Errorwidgets extends StatelessWidget {
  const Errorwidgets({super.key, required this.msg});
  
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(163, 0, 0, 1.0)
      ),
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error,color: Colors.white,size: 40,),
          Text("${msg}",style: TextStyle(
              color: Colors.white
          ),),
        ],
      )),
    );;
  }
}
