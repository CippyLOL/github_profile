import 'package:github_profile/services/networking.dart';

//const githubUrl = 'https://api.github.com/users/';
const errorMessage = 'User does not exist';

class User {
  // needed variables
  String username;
  String name;
  String avatarUrl;
  String blog;
  String location;
  String repoUrl;
  int followers;
  int following;
  int repos;

  //constructor; initialize variables
  User({
    this.username,
    this.name,
    this.avatarUrl,
    this.blog,
    this.location,
    this.repoUrl,
    this.followers,
    this.following,
    this.repos,
  });

  //get username from user, create a function getUser()
  //add url inside
  Future<dynamic> getUser() async {
    // should be username = this username!!
    username = this.username;
    String githubUrl = 'https://api.github.com/users/$username';
    Networking networking = Networking(url: githubUrl);

    var user = await networking.getData();

    try {
      username = user['login'] ?? 'not available';
      name = user['name'] ?? 'Not available';
      avatarUrl = user['avatar_url'];
      blog = user['blog'] ?? 'Not available';
      location = user['location'] ?? 'Not available';
      repoUrl = user['repos_url'] ?? 'Not available';
      followers = user['followers'] ?? 0;
      following = user['following'] ?? 0;
      repos = user['public_repos'] ?? 0;

      return user;
    } catch (e) {
      print('not found...');
      print(e);
      return;
    }
  }
}
