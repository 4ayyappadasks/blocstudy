import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloctest2_bloc.dart';

class Bloctest2Wrapper extends StatelessWidget {
  const Bloctest2Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => test2Bloc(),
      child: Bloctest2(),
    );
  }
}

class Bloctest2 extends StatelessWidget {
  const Bloctest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<test2Bloc, test2State>(
            builder: (context, state) {
              int val = 0;
              if (state is Chnagevalue) {
                val = state.value;
              }
              return Text("$val");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<test2Bloc>().add(Changevalueevent(value: 1));
                },
                child: Text("inc"),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  context.read<test2Bloc>().add(Changevalueevent(value: -1));
                },
                child: Text("dec"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

