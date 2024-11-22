import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/application/page/trailproject_page.dart';

import '../../../bottomfield/application/bloc/trailproject_bloc.dart';
import '../bloc/trailerprojectlist_bloc.dart';

class TrailerprojectlistPageWraper extends StatelessWidget {
  const TrailerprojectlistPageWraper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerprojectlistBloc()
        ..add(
          Getmethodevent(),
        ),
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
                if (state is TrailerprojectlistInitial) {
                  return const Text("list bloc waiting");
                } else if (state is TrailGetprojectloading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is TrailGetprojectloaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.trailerprojectEntity.posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            state.trailerprojectEntity.posts[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            state.trailerprojectEntity.posts[index].body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is TrailGetprojecterror) {
                  return Center(
                    child: Text(state.ermsg),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          TrailprojectBottomsheetwrapper(),
        ],
      ),
    );
  }
}
