class MemberDetailModel {
  String name;
  String position;
  String githubUrl;
  String linkedinUrl;
  String assetImage;
  MemberDetailModel(
      {required this.name,
      required this.position,
      required this.githubUrl,
      required this.linkedinUrl,
      required this.assetImage});
}

List<MemberDetailModel> memberDetails = [
  MemberDetailModel(
      name: "Dummy Name 1",
      position: "Technical Lead",
      githubUrl: "https://github.com/",
      linkedinUrl: "https://www.linkedin.com/login",
      assetImage: "assets/images/blank_photo.jpg"),
  MemberDetailModel(
      name: "Dummy Name 2",
      position: "Technical Lead",
      githubUrl: "https://github.com/",
      linkedinUrl: "https://www.linkedin.com/login",
      assetImage: "assets/images/blank_photo.jpg"),
  MemberDetailModel(
      name: "Dummy Name 3",
      position: "Technical Lead",
      githubUrl: "https://github.com/",
      linkedinUrl: "https://www.linkedin.com/login",
      assetImage: "assets/images/blank_photo.jpg"),
];
