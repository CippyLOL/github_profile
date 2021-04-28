import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_profile/widgets/card.dart';
import 'package:github_profile/widgets/icon_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubProfile extends StatefulWidget {
  GithubProfile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GithubProfileState createState() => _GithubProfileState();
}

class _GithubProfileState extends State<GithubProfile> {
  Map user = {};

  @override
  Widget build(BuildContext context) {
    // retrieve user data from loading screen
    user = ModalRoute.of(context).settings.arguments;
    String avatarUrl = user['avatarUrl'].toString();
    //var _url = user['repoUrl'];
    String username = user['username'].toString();
    var _url = 'https://github.com/$username?tab=repositories';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
    // if username does not exist...
    // if (data['username'] == null) {
    //   data['username'] = 'not found';
    //   data['name'] = 'not found';
    //   data['location'] = 'not found';
    //   data['blog'] = 'not found';
    //   data['avatarUrl'] =
    //       'https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2Flogos&psig=AOvVaw00WPw-lrqzhfEyR3MPxfNL&ust=1618924213447000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOCA2uawivACFQAAAAAdAAAAABAD';
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('DevSearch'),
        leading: new Container(),
        //add icons
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search icon button was pressed');
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('setting icon button was pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 95.0,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              user['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            IconWithText(
              iconName: Icon(Icons.account_circle_outlined),
              textName: user['username'],
            ),
            IconWithText(
              iconName: Icon(Icons.location_on_outlined),
              textName: user['location'],
            ),
            IconWithText(
              iconName: Icon(Icons.language_outlined),
              textName: user['blog'],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CardInfo(
                      cardName: 'Repositories',
                      cardNumber: user['repos'],
                    ),
                    CardInfo(
                      cardName: 'Followers',
                      cardNumber: user['followers'],
                    ),
                    CardInfo(
                      cardName: 'Following',
                      cardNumber: user['following'],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.tealAccent.withAlpha(75),
                ),
              ),
              onPressed: _launchURL,
              child: Text('Link to Repository'),
            ),
          ],
        ),
      ),
    );
  }
}
