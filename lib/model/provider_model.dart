class ProviderUserModel {
  final String fName;
  final String lName;
  final String email;
  final String profileUrl;
  final String phone;

  ProviderUserModel(
      {required this.fName,
      required this.lName,
      required this.email,
      required this.profileUrl,
      required this.phone});
}

ProviderUserModel demoProvider = ProviderUserModel(
    fName: "Wade",
    lName: "Warren",
    email: "demo@domain.com",
    profileUrl: "assets/images/servicecover4.png",
    phone: "0000000000");
