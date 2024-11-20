import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/blocpost/application/bloc/postbloc_bloc.dart';
import 'package:flutterblocstudey/main.dart';

class PostPage1 extends StatelessWidget {
  const PostPage1({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = PostblocBloc(id: id);
        bloc.add(PostblocApicallEvent());
        return bloc;
      },
      child: Scaffold(
    body: BlocBuilder<PostblocBloc, PostblocState>(
  builder: (context, state) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<PostblocBloc>().add(PostblocApicallEvent());
      },
      child: ListView(
        children: [
          Container(
            height: MyApp.height,
            width: MyApp.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFACCCC), Color(0xFFFFF5F5), Color(0xFFFACCCC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: BlocBuilder<PostblocBloc, PostblocState>(
                builder: (context, state) {
                  if (state is PostblocInitial) {
                    return const Text("Waiting...");
                  } else if (state is Postblocloading) {
                    return const CircularProgressIndicator(
                      color: Colors.blueAccent,
                    );
                  } else if (state is Postblocloaded) {
                    return Text("Post ID: ${state.postblocEntity.id}");
                  } else if (state is Postblocerror) {
                    return Text("Error: ${state.errmsg}");
                  } else {
                    return const Text("Unknown state");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  },
),
        )

    );
  }
}

