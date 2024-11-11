import 'package:flutter/material.dart';

class Quoteloadedwidet extends StatelessWidget {
  const Quoteloadedwidet({super.key, required this.msg});
  
  final String msg;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(2, 95, 101, 1.0)
      ),
      child: Center(child: Text("${msg}",style: TextStyle(
        color: Colors.white
      ),)),
    );
  }
}
