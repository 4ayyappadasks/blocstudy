import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/bloclib3/application/Dummyjsonipage/bloc/dummyjson_api_bloc.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';

class Dummypaged extends StatelessWidget {
  const Dummypaged({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = DummyjsonApiBloc();
        bloc.add(LoadDemoApidataEvent());
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<DummyjsonApiBloc, DummyjsonApiState>(
          builder: (context, state) {
            if (state is DummyjsonApiInitial) {
              return const Center(
                child: Text("Data is loading"),
              );
            } else if (state is DummyjsonApiLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is DummyjsonApiLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final item = state.data[index] as DatumEntity;
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.id),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Error in page"),
              );
            }
          },
        ),
      ),
    );
  }
}
