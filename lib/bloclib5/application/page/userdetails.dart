import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocstudey/bloclib5/application/bloc/userdetails_bloc.dart';
import 'Searchpage/searchpage.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = UserdetailsBloc();
        bloc.add(FetchDetailsFromApiEvent());
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<UserdetailsBloc, UserdetailsState>(
  builder: (context, state) {
    return RefreshIndicator(
          onRefresh: () async {
            context.read<UserdetailsBloc>().add(FetchDetailsFromApiEvent()); // Re-fetch data
          },
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: SliverSearchAppBar(),
                pinned: true,
              ),
              BlocBuilder<UserdetailsBloc, UserdetailsState>(
                builder: (context, state) {
                  if (state is UserdetailsInitial) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text("Data is waiting"),
                      ),
                    );
                  } else if (state is UserdetailsLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      ),
                    );
                  } else if (state is UserdetailsLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(16),
                            child:  Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image.network("${state.userdetailsEvent.data[index].avatar}"),
                                  title: Text("${state.userdetailsEvent.data[index].name}"),
                                  subtitle: Text("${state.userdetailsEvent.data[index].details.email}"),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: state.userdetailsEvent.data.length, // Use actual data
                      ),
                    );
                  } else if (state is UserdetailsError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text("${state.ermsg}"),
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text("An unexpected error occurred"),
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
    );
  }
}

class BackgroundWave extends StatelessWidget {
  final double height;

  const BackgroundWave({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundWaveClipper(),
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFACCCC), Color(0xFFFFF5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const minSize = 140.0;
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();

    final path = Path();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final adjustedShrinkOffset = shrinkOffset > minExtent ? minExtent : shrinkOffset;
    final offset = (minExtent - adjustedShrinkOffset) * 0.5;
    final topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        const BackgroundWave(
          height: 280,
        ),
        Positioned(
          top: topPadding + offset,
          left: 16,
          right: 16,
          child: SearchBar(),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

class SearchBar extends StatelessWidget {
  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: pink,
          focusedBorder: _border(pink),
          border: _border(grey),
          enabledBorder: _border(grey),
          hintText: 'Start brand search',
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onFieldSubmitted: (value) {},
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: color),
    borderRadius: BorderRadius.circular(12),
  );
}
