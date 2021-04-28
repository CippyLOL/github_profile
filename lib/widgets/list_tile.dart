import 'package:flutter/material.dart';
import 'package:github_profile/widgets/icon_text.dart';

class RepoTile extends StatelessWidget {
  //  Declare variables
  final String repoName;
  final String repoDesc;
  final int stars;
  final int fork;

  const RepoTile({Key key, this.repoName, this.repoDesc, this.stars, this.fork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            height: 120.0,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.folder_open_outlined,
                  size: 50.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'repoName',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(repoDesc),
                    Row(
                      children: [
                        IconWithText(
                          iconName: Icon(Icons.star_border_outlined),
                          textName: stars.toString(),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        IconWithText(
                          iconName: Icon(Icons.alt_route_outlined),
                          textName: fork.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
