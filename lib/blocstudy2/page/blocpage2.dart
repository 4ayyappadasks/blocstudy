import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocpage2_bloc.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return BlocProvider(
      create: (context) => Page2Bloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("To-Do List")),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Enter the data to add to list",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              BlocBuilder<Page2Bloc, page2State>(
                builder: (context, state) {
                  return MaterialButton(
                    onPressed: state is Page2Loading
                        ? null
                        : () {
                      final data = textController.text;
                      BlocProvider.of<Page2Bloc>(context).add(AddData(data));
                      textController.clear();
                    },
                    child: state is Page2Loading
                        ? CircularProgressIndicator(color: Colors.red)
                        : Text("Add Data"),
                    elevation: 20,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<Page2Bloc, page2State>(
                  builder: (context, state) {
                    if (state is Page2Initial) {
                      return const Center(child: Text("No items added yet."));
                    } else if (state is Page2Loaded || state is Page2Loading) {
                      final dataList = (state is Page2Loaded)
                          ? state.dataList
                          : (state as Page2Loading).dataList;
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(dataList[index]),
                          );
                        },
                      );
                    } else if (state is Page2Error) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
