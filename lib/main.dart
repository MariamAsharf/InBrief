import 'package:flutter/material.dart';
import 'package:news_app/my_theme/theme.dart';
import 'package:provider/provider.dart';

import 'My_provider/my_provider.dart';
import 'home_screen.dart';
import 'my_theme/dark_theme.dart';
import 'my_theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseLine lightTheme = LightTheme();
    BaseLine darkTheme = DarkTheme();

    return MaterialApp(
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
