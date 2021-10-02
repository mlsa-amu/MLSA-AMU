class MemberDetailModel {
  String name;
  String position;
  String githubUrl;
  String linkedinUrl;
  String assetImage;
  MemberDetailModel({
    required this.name,
    required this.position,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.assetImage,
  });
}

List<MemberDetailModel> memberDetails = [
  MemberDetailModel(
    name: "Pranshi Jindal",
    position: "Organiser Lead",
    githubUrl: "https://github.com/",
    linkedinUrl: "https://www.linkedin.com/login",
    assetImage: "assets/images/blank_photo.jpg",
  ),
  MemberDetailModel(
    name: "Vidita Agrawal",
    position: "Technical Lead",
    githubUrl: "https://github.com/",
    linkedinUrl: "https://www.linkedin.com/login",
    assetImage: "assets/images/blank_photo.jpg",
  ),
  MemberDetailModel(
    name: "Harsh Taliwal",
    position: "Technical Lead",
    githubUrl: "https://github.com/",
    linkedinUrl: "https://www.linkedin.com/login",
    assetImage: "assets/images/blank_photo.jpg",
  ),
];
