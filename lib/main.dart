import 'package:flutter/material.dart';
import 'package:github_profile/screens/github_profile.dart';
import 'package:github_profile/screens/search_screen.dart';
import 'package:github_profile/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevHub - Github profiles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SearchScreen(),
        '/loadingScreen': (context) => LoadingScreen(),
        '/githubProfile': (context) => GithubProfile(),
      },
    );
  }
}
