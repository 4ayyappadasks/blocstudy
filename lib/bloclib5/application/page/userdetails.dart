import 'package:flutter/material.dart';

class Userdetails extends StatelessWidget {
  const Userdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              backgroundColor: Color(0xffa4c1ff),
              bottom: PreferredSize(preferredSize: Size(double.infinity, 100), child: Container(
                child: Text("User Details",style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
              )),
            )
          ],
        ),
      ),
    );
  }
}
