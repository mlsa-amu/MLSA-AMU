class MemberDetailModel {
  String name ;
  String position ;
  String githubUrl ;
  String linkedinUrl ;
  String assetImage;
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

  fromMap(doc) {
    this.name = doc['name'];
    this.position = doc['position'];
    this.githubUrl = doc['githubUrl'];
    this.linkedinUrl = doc['linkedinUrl'];
    this.assetImage = doc['image'];
  }
}
