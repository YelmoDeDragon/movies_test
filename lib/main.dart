import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/screens/screens.dart';
import 'package:movies/providers/movies_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(), 
        'details': (_) => const DetailsScreen()
      },
      theme: ThemeData.light()
        .copyWith(appBarTheme: const AppBarTheme(color: Colors.purple)),
    );
  }
}
