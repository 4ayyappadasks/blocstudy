import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../QuoteBloc/quotbloc_bloc.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        BlocProvider.of<QuotblocBloc>(context).add(RequestQuote());
      },
      child: Material(
        color: Color.fromRGBO(31, 64, 57, 1.0),
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Text("Generate the Quote",style: TextStyle(
            color: Colors.white
          ),),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
