class ContributorsModel {
  String? contributorName;
  int? contributions;
  String? githubUrl;
  String? contributorsImage;

  ContributorsModel({
    required this.contributorName,
    required this.contributions,
    required this.githubUrl,
    required this.contributorsImage,
  });

  ContributorsModel.fromJson(Map<String, dynamic> json) {
    contributorName = json['login'];
    contributions = json['contributions'];
    githubUrl = json['html_url'];
    contributorsImage = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contributorName'] = this.contributorName;
    data['contributions'] = this.contributions;
    data['githubUrl'] = this.githubUrl;
    data['image'] = this.contributorsImage;
    return data;
  }
}
