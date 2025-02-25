import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/theme_cubit.dart';
import 'package:news_app/internet_services.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/my_theme/theme.dart';
import 'package:news_app/repository/home_remote_impl.dart';
import 'package:news_app/widgets/news_details.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc_observer.dart';
import 'home_screen.dart';
import 'my_theme/dark_theme.dart';
import 'my_theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  InternetServices().init();
  Hive.initFlutter();
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(SourcesResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => HomeCubit(HomeRemoteImpl())),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseLine lightTheme = LightTheme();
    BaseLine darkTheme = DarkTheme();

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: lightTheme.themeData,
          darkTheme: darkTheme.themeData,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            NewsDetails.routeName: (context) => NewsDetails(),
          },
        );
      },
    );
  }
}
