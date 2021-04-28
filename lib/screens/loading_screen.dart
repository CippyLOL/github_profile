import 'package:flutter/material.dart';
import 'dart:async';
import 'package:github_profile/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String usernameSearched = 'loading...';
  Map user = {};
  bool notfound = false;

  void setupUser(String username) async {
    User user = User(username: usernameSearched);
    await user.getUser();

    print(user.username);
    print(user.name);

    if (user.name == null) {
      print('from loading_screen: user not found');
      //Navigator.popAndPushNamed(context, '/');
      notfound = true;

      print(notfound);
    } else {
      // // check if the user is found, push to github profile screen
      // // if not found, do not redirect to the user profile screen
      Navigator.pushReplacementNamed(context, '/githubProfile', arguments: {
        'username': user.username,
        'name': user.name,
        'location': user.location,
        'repoUrl': user.repoUrl,
        'blog': user.blog,
        'avatarUrl': user.avatarUrl,
        'followers': user.followers,
        'following': user.following,
        'repos': user.repos,
      });
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User Not Found'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This user does not exist.'),
                  Text('Please search for an existing user.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                  notfound = false;
                },
              ),
            ],
          );
        },
      );
    }

    if (notfound) {
      _showMyDialog();
    }
  }

  // void setupRepos() async {
  //   Repo repo = Repo();
  //   await repo.getRepos();
  // }

  @override
  void initState() {
    super.initState();
    //setupUser();
    //setupRepos();
  }

  @override
  Widget build(BuildContext context) {
    //  from user map to retrieve username value from key:'username'
    user = ModalRoute.of(context).settings.arguments;
    usernameSearched = user['username'].toString();
    print(usernameSearched);
    setupUser(usernameSearched);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitRing(
            color: Colors.white,
            size: 70.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Loading...'),
        ],
      )),
    );
  }
}
