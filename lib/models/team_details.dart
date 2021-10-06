class MemberDetailModel {
  String? name;
  String? position;
  String? githubUrl;
  String? linkedinUrl;
  String? assetImage;
  MemberDetailModel({
    required this.name,
    required this.position,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.assetImage,
  });

  Map toMap(MemberDetailModel member) {
    Map<String, dynamic> teamMap = Map<String, dynamic>();
    teamMap['name'] = member.name;
    teamMap['position'] = member.position;
    teamMap['githubUrl'] = member.githubUrl;
    teamMap['linkedinUrl'] = member.linkedinUrl;
    teamMap['image'] = member.assetImage;
    return teamMap;
  }

  MemberDetailModel.fromMap(doc) {
    name = doc['name'];
    position = doc['position'];
    githubUrl = doc['githubUrl'];
    linkedinUrl = doc['linkedinUrl'];
    assetImage = doc['image'];
  }
}
