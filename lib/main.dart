import 'package:flutter/material.dart';
import 'package:flutterblocstudey/bloclib2/application/features/MockApi/page/MockApi_page1.dart';
import 'package:flutterblocstudey/bloclib3/application/Dummyjsonipage/page/dummypage.dart';
import 'package:provider/provider.dart';

import 'bloclib/application/core/Services/theme_services.dart';
import 'bloclib/application/features/post/post_page.dart';
import 'bloclib/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServiceProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
        builder: (context, themeService, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home:Dummypaged()
          // MockApiPage1()
          // PostPage()
          //     Page2()
          // // Quotepage(),
          );
    });
  }
}
