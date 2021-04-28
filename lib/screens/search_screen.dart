import 'package:flutter/material.dart';
import 'package:github_profile/screens/github_profile.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String username;
  Map notFound = {};
  bool popback = false;
  // void _gotoProfile() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => GithubProfile(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevSearch'),
        leading: new Container(),
        //add icons
        actions: <Widget>[
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
              radius: 80.0,
              backgroundColor: Colors.amberAccent,
            ),
            Container(
              padding: EdgeInsets.all(50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search GitHub Profile',
                  filled: true,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                // onChanged to be used to retrieve the user input
                // send value to user model (NEED TO BE CREATED)
                onChanged: (value) {
                  username = value;
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.tealAccent.withAlpha(75),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/loadingScreen',
                    arguments: {
                      'username': username,
                    });
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
