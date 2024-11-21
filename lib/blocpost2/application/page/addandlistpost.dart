import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/blocpost2/application/blocApi/blocpost2_bloc.dart';

class Addandlistpost extends StatelessWidget {
  Addandlistpost({super.key});

  TextEditingController tittle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = post2Bloc();
        bloc.add(Getmethodevent()); // Fetch initial data
        return bloc;
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<post2Bloc, post2State>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<post2Bloc>().add(Getmethodevent());
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 150,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: const Text(
                          'Get & Post METHODS',
                          style: TextStyle(color: Colors.white),
                        ),
                        background: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Button placed inside the body
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return BlocProvider(
                                  create: (context) => post2Bloc(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Add a New Post',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: tittle,
                                          decoration: const InputDecoration(
                                            labelText: 'Title',
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: (value) {
                                            tittle.text = value.toString();
                                            print(tittle.text);
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        BlocBuilder<post2Bloc, post2State>(
                                          builder: (context, state) {
                                            if (state is post2Loading) {
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state is post2POSTLoaded) {
                                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                                Navigator.pop(context);
                                                tittle.clear(); // Clear the text field after post
                                              });
                                              return const Center(
                                                child: Text('Post submitted successfully!'),
                                              );
                                            } else if (state is post2Error) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  final titleText = tittle.text.trim();
                                                  if (titleText.isNotEmpty) {
                                                    context.read<post2Bloc>().add(
                                                        Postmethodevent(tittle: titleText));
                                                  } else {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content: Text("Title cannot be empty")),
                                                    );
                                                  }
                                                },
                                                child: Text('Error: ${state.ermsg}'),
                                              );
                                            } else {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  final titleText = tittle.text.trim();
                                                  if (titleText.isNotEmpty) {
                                                    context.read<post2Bloc>().add(
                                                        Postmethodevent(tittle: titleText));
                                                  } else {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content: Text("Title cannot be empty")),
                                                    );
                                                  }
                                                },
                                                child: const Text('Submit'),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    BlocBuilder<post2Bloc, post2State>(
                      builder: (context, state) {
                        if (state is post2Initial) {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Text("Waiting for response"),
                            ),
                          );
                        } else if (state is post2Loading) {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is post2GETLoaded) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.blueAccent,
                                          child: Text(
                                            "${state.getmethodentity.posts[index].id}",
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            state.getmethodentity.posts[index].title,
                                            style: Theme.of(context).textTheme.titleMedium,
                                          ),
                                        ),
                                        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              childCount: state.getmethodentity.posts.length,
                            ),
                          );
                        } else if (state is post2Error) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text(state.ermsg),
                            ),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Text("Unknown state"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
