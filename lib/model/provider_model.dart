class ProviderUserModel {
  final String fName;
  final String lName;
  final String email;
  final String tagline;
  final String description;
  final String profileUrl;
  final String location;
  final double rating;
  final String phone;
  final String joined;

  ProviderUserModel({
    required this.fName,
    required this.lName,
    required this.email,
    required this.tagline,
    required this.description,
    required this.location,
    required this.rating,
    required this.profileUrl,
    required this.phone,
    required this.joined,
  });
}

ProviderUserModel demoProvider = ProviderUserModel(
  fName: "Wade",
  lName: "Warren",
  email: "demo@domain.com",
  location: "Gandhinagar, Gujarat",
  rating: 4.5,
  description:
      "It is a long established fact  that a  reader will be distracted by the readable content  of a page when looking at its layout",
  tagline: "Electrician Export",
  profileUrl: "assets/images/servicecover4.png",
  phone: "0000000000",
  joined: "2014",
);

ProviderUserModel demoProvider1 = ProviderUserModel(
  fName: "Bhargav",
  lName: "Kavathiya",
  email: "dummy@domain.com",
  location: "Sector -26, Gujarat",
  rating: 4.5,
  description:
      "It is a long established fact  that a  reader will be distracted by the readable content  of a page when looking at its layout",
  tagline: "Electrician Expert",
  profileUrl: "assets/images/servicecover3.png",
  phone: "0101010101",
  joined: "2017",
);
