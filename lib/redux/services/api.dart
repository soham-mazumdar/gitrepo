import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:gitrepo/redux/models/profile.dart';
import 'package:gitrepo/redux/models/repos.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String _baseURL = "api.github.com";
  
  /// gets API DATA
  Future<Profile> getUser(String username) async {
    
    /// get basic profile
    Uri uri = Uri.https(_baseURL,'users/'+username.toString());
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri,headers: header);
    Map<String, dynamic> body = json.decode(response.body);
    log(response.body.toString());
    Profile profile;
    
    if(!body.containsKey('message')){
      
      /// get Repos
      Uri uri = Uri.https(_baseURL,'users/'+username+'/repos');
      var repos = await http.get(uri,headers: header);
      List<dynamic> reposBody = json.decode(repos.body);
      
      
      List<Repo> _repos = [];
      reposBody.forEach((element) async {
        _repos.add(Repo.fromJson(element));
      });

      profile = Profile.fromJson(body,_repos);
      print(profile.repos.length);
    }
    return profile;
  }
}