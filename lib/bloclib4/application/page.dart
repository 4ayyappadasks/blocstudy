import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/bloclib4/application/bloc/try1_bloc.dart';

class try1page extends StatelessWidget {
  const try1page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = Try1Bloc();
        bloc.add(Loadapievent());
        return bloc;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: BlocBuilder<Try1Bloc, Try1State>(
            builder: (context, state) {
              if(state is Try1Initial)
                {
                 return Center(
                    child: Text("data is wating"),
                  );
                }
              else if(state is Try1loaidng)
                {
                 return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              else if(state is Try1loaded) {
                return ListView.builder(
                  itemCount: state.try1entity.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text("${state.try1entity.data[index].name}"),
                    );
                  },
                );
              }
              else if(state is Try1error)
                {
                  return Center(
                    child: Text("error is ${state.msg}"),
                  );
                }
              else
                {
                  return Center(
                    child: Text("error"),
                  );
                }
            },
          ),
        ),
      ),
    );
  }
}
