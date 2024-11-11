import 'package:flutter/material.dart';
import 'package:flutterblocstudey/blocstudy2/page/blocpage2.dart';

import 'Pages/quotepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Page2()
      // Quotepage(),
    );
  }
}

