import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ui1_bloc.dart';

class Ui1Wrapper extends StatelessWidget {
  const Ui1Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Ui1Bloc(),
      child: Ui1(),
    );
  }
}

class Ui1 extends StatelessWidget {
  const Ui1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
