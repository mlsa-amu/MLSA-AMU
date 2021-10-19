import 'package:mlsa_amu/models/contributors.dart';

class RepoDetailsModel {
  String? repoName;
  String? repoDescription;
  int? stars;
  int? forks;
  int? openIssues;
  String? contributorsUrl;
  List<ContributorsModel>? contributorsList = [];

  RepoDetailsModel({
    this.repoName,
    this.repoDescription,
    this.stars,
    this.forks,
    this.openIssues,
    this.contributorsUrl,
    this.contributorsList,
  });

  RepoDetailsModel.fromJson(Map<String, dynamic> json) {
    repoName = json['name'];
    repoDescription = json['description'];
    stars = json['watchers_count'];
    forks = json['forks_count'];
    openIssues = json['open_issues_count'];
    contributorsUrl = json['contributors_url'];
    contributorsList = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repoName'] = this.repoName;
    data['repoDescription'] = this.repoDescription;
    data['stars'] = this.stars;
    data['forks'] = this.forks;
    data['openIssues'] = this.openIssues;
    data['contributorsUrl'] = this.contributorsUrl;
    return data;
  }
}
