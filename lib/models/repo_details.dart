class RepoDetailsModel {
  String? repoName;
  String? repoDescription;
  int? stars;
  int? forks;
  int? openIssues;
  String? contributorsUrl;
  String? starUrl;
  List<UserDetails>? contributorsList = [];

  RepoDetailsModel({
    this.repoName,
    this.repoDescription,
    this.stars,
    this.forks,
    this.openIssues,
    this.contributorsUrl,
    this.starUrl,
    this.contributorsList,
  });

  RepoDetailsModel.fromJson(Map<String, dynamic> json) {
    repoName = json['name'];
    repoDescription = json['description'];
    stars = json['watchers_count'];
    forks = json['forks_count'];
    openIssues = json['open_issues_count'];
    contributorsUrl = json['contributors_url'];
    starUrl = json['stargazers_url'];
    contributorsList = [];
  }
}

class UserDetails {
  String? fullName;
  String? bio;
  String? userName;
  int? contributions;
  String? githubUrl;
  String? apiUrl;
  String? userImage;

  UserDetails({
    this.fullName,
    this.bio,
    this.userName,
    this.contributions,
    this.githubUrl,
    this.apiUrl,
    this.userImage,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    bio = json['bio'];
    userName = json['login'];
    contributions = json['contributions'];
    githubUrl = json['html_url'];
    apiUrl = json['url'];
    userImage = json['avatar_url'];
  }
}
