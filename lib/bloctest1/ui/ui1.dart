import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloctest1_bloc.dart';

class Bloctest1Wrapper extends StatelessWidget {
  const Bloctest1Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => test1Bloc(),
      child: Bloctest1(),
    );
  }
}

class Bloctest1 extends StatelessWidget {
  const Bloctest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocBuilder<test1Bloc, test1State>(
        builder: (context, state) {
          int value = 0;


          if (state is ValueChangedState) {
            value = state.value;
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$value",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<test1Bloc>()
                            .add(incvalue(value: 1));
                      },
                      child: const Text("Increase"),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<test1Bloc>()
                            .add(decvalue(value: 1));
                      },
                      child: const Text("Decrease"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
