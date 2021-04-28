import 'package:github_profile/services/networking.dart';

//const githubUrl = 'https://api.github.com/users/';
const errorMessage = 'User does not exist';

class Repo {
  // needed variables
  String username;
  String repoName;
  String repoDesc;
  int stars;
  int forks;

  //constructor; initialize variables
  Repo({
    this.username,
    this.repoName,
    this.repoDesc,
    this.stars,
    this.forks,
  });

  //get username from user, create a function getUser()
  //add url inside
  // Future<dynamic> getRepos() async {
  //   // should be username = this username!!
  //   username = 'octocat';
  //   String githubUrl = 'https://api.github.com/users/$username/repos';
  //   Networking networking = Networking(url: githubUrl);

  //   var repos = await networking.getRepo();

  //   print(repos);

  //   return repos;
  // }
}
