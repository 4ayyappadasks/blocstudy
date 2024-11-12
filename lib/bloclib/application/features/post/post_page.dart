import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/bloclib/application/features/post/post_bloc/postloadbloc_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/Services/theme_services.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return BlocProvider(
      create: (context) => PostloadblocBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "PostApp using Bloc",
            style: themedata.textTheme.titleMedium,
          ),
          actions: [
            BlocBuilder<PostloadblocBloc, PostloadblocState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<PostloadblocBloc>(context)
                          .add(PostloadedEvent());
                    },
                    icon: Icon(Icons.refresh));
              },
            ),
            Switch(
                activeColor: Colors.green,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                value: Provider
                    .of<ThemeServiceProvider>(context)
                    .isDarkModeOn,
                inactiveTrackColor: Colors.blueGrey,
                inactiveThumbColor: Colors.black87,
                onChanged: (_) {
                  Provider.of<ThemeServiceProvider>(context, listen: false)
                      .toggleTheme();
                }),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Plots",
                  style: themedata.textTheme.displayLarge,
                ),
                Expanded(
                    child: BlocBuilder<PostloadblocBloc, PostloadblocState>(
                      builder: (context, state) {
                        if (state is PostloadblocInitial) {
                          return Center(
                            child: Text("Post is wating"),
                          );
                        } else if (state is Postloading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        } else if (state is Postloaded) {
                          return ListView.builder(
                            itemCount: state.post.length,
                            itemBuilder: (context, index) =>
                                Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                        "${index + 1}",
                                        style: themedata.textTheme.displayLarge,
                                      ),
                                    ),
                                    title: Text(
                                      "${state.post[index].title}",
                                      style: themedata.textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "${state.post[index].body}",
                                      style: themedata.textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                          );
                        } else {
                          return Center(
                            child: Text("Post is having an error"),
                          );
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
