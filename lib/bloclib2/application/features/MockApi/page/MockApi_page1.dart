import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/bloclib/application/features/post/post_page.dart';
import 'package:flutterblocstudey/bloclib2/application/features/MockApi/bloc/mock_api_bloc.dart';

class MockApiPage1 extends StatelessWidget {
  const MockApiPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = MockApiBloc();
        bloc.add(LoadMockApiEvent1());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mock Api Calling"),
          centerTitle: true,
          actions: [
            BlocBuilder<MockApiBloc, MockApiState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    // Manually refresh data on button press
                    context.read<MockApiBloc>().add(LoadMockApiEvent1());
                  },
                  icon: Icon(Icons.refresh),
                );
              },
            ),
            IconButton(onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PostPage(),));
            }, icon: Icon(Icons.skip_next))
          ],
        ),
        body: BlocBuilder<MockApiBloc, MockApiState>(
          builder: (context, state) {
            if (state is MockApiInitial) {
              return Center(
                child: Text("Data is waiting"),
              );
            } else if (state is MockApiLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is MockApiLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text("${state.data[index].name}"),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("Error in page"),
              );
            }
          },
        ),
      ),
    );
  }
}
