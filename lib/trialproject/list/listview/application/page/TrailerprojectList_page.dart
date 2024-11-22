import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/application/page/trailproject_page.dart';

import '../bloc/trailerprojectlist_bloc.dart';

class TrailerprojectlistPageWraper extends StatelessWidget {
  const TrailerprojectlistPageWraper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = TrailerprojectlistBloc();
        bloc.add(Getmethodevent());
        return bloc;
      },
      child: TrailerprojectlistPage(),
    );
  }
}

class TrailerprojectlistPage extends StatelessWidget {
  const TrailerprojectlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B00C0),
        foregroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        title: const Text(
          "Trail Project",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: BlocBuilder<TrailerprojectlistBloc, TrailerprojectlistState>(
              builder: (context, state) {
                return state is TrailerprojectlistInitial
                    ? const Text("list bloc waiting")
                    : state is TrailGetprojectloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : state is TrailGetprojectloaded
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    state.trailerprojectEntity.posts.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(
                                        state.trailerprojectEntity.posts[index]
                                            .title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(state.trailerprojectEntity
                                          .posts[index].body,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
                                    ),
                                  );
                                },
                              )
                            : state is TrailGetprojecterror
                                ? Center(
                                    child: Text(state.ermsg),
                                  )
                                : SizedBox.shrink();
              },
            ),
          ),
          const TrailprojectBottomsheetwrapper()
          // // Status Message Section
          // BlocBuilder<TrailprojectBloc, TrailprojectState>(
          //   builder: (context, state) {
          //     if (state is Trailprojectloaded) {
          //       return Text("Message sent: ${state.trialprojectentity.title}");
          //     } else if (state is Trailprojecterror) {
          //       return Text("Error: ${state.ermsg}");
          //     }
          //     return const SizedBox.shrink();
          //   },
          // ),
        ],
      ),
    );
  }
}
