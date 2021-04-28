import 'package:github_profile/models/repos.dart';
import 'package:github_profile/models/user_repos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//  networking object should take in url only! (with username)
class Networking {
  //String username;

  String url;
  int statusCode;

  Networking({
    this.url,
    //this.username,
    // this.name,
    // this.avatarUrl,
    // this.location,
    // this.blog,
    // this.followers,
    // this.following,
    //this.data
  });

  //Future<dynamic> getRepo async {}, get username too

  // Future<dynamic> getUser() async {
  //   username = this.username;
  //   var url = Uri.parse('https://api.github.com/users/$username');

  //   //  Make http request GET from Github API
  //   http.Response response = await http.get(url);
  //   Map data = jsonDecode(response.body);

  //   statusCode = response.statusCode;

  //   if (statusCode == 200) {
  //     name = data['name'];s
  //     blog = data['blog'];
  //     location = data['location'];
  //     avatarUrl = data['avatar_url'];
  //     followers = data['followers'];
  //     following = data['following'];
  //     repo = data['public_repos'];
  //   } else {
  //     print(statusCode);
  //   }
  // }

  Future getData() async {
    Uri apiUrl = Uri.parse(url);
    try {
      http.Response response = await http.get(apiUrl);
      Map data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        print(response.statusCode);
        return;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // static Future<List<UserRepos>> getRepos() async {
  //   try {
  //     String repoUrl = 'https://api.github.com/users/octocat/repos';
  //     Uri apiUrl = Uri.parse(repoUrl);
  //     http.Response response = await http.get(apiUrl);
  //     if (response.statusCode == 200) {
  //       final List<UserRepos> listRepos = userReposFromJson(response.body);
  //     } else {
  //       return List<UserRepos>();
  //     }
  //   } catch (e) {
  //     return List<UserRepos>();
  //   }
  // }
}
