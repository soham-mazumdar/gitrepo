import 'package:flutter/material.dart';
import 'package:gitrepo/redux/models/repos.dart';

class Profile {
  
  String name;
  String image; // avatar_url | gravatar_id
  String company; // company
  String blog; // blog
  String location;//
  String email;// string | null, 
  String hireable; // bool | null
  String bio; // string | null
  List<Repo> repos;
  
  Profile({
    @required this.name,
    @required this.image,
    @required this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.repos,
  });

  Profile.fromJson(Map<String, dynamic> json,List<Repo> rep){
    name =  json['name'];
    image = json['avatar_url'] != '' ? json['avatar_url'] : json['gravatar_id'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['poster_path'] == null ? 'Not Mentioned' : json['poster_path'] == null ? 'Yes' : 'No';
    bio = json['bio'];
    repos = rep;
    
  }

  
}

