import 'package:flutter/material.dart';

class Repo {
  
  String name;//	"agile-week"
  String fullName;//	"timmywheels/agile-week"
  String description;//	"Career Devs Agile Week 2018"
  String url;//	"https://api.github.com/r…s/timmywheels/agile-week"
  String createdAt;//	"2018-06-05T00:00:37Z"
  int watchersCount;//	1
  String language;//	"HTML"
  int forksCount;//	3
  int openIssuesCount;//	0
  String branchesUrl;
  String commitsUrl;
  String gitUrl;
  
  Repo({
    @required this.name,
    @required this.fullName,
    @required this.createdAt,
    @required this.watchersCount,
    @required this.language,
    @required this.forksCount,
    @required this.openIssuesCount,
    this.description,
    this.url,
    this.branchesUrl,
    this.commitsUrl,
    this.gitUrl
  });

  Repo.fromJson(Map<String, dynamic> json){
    name = json['name'];
    fullName = json['full_name'];
    createdAt = json['created_at'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    forksCount = json['forks_count'];
    openIssuesCount = json['open_issues_count'];
    description = json['description'];
    url = json['url'];
    branchesUrl = json['branches_url'];
    commitsUrl = json['commits_url'];
    gitUrl = json['git_url'];
    
  }

  
}

