class ProviderUserModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String tagline;
  final String description;
  final String profileUrl;
  final String location;
  final double rating;
  final String phone;
  final DateTime joined;

  ProviderUserModel({
    required this.id,
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

  factory ProviderUserModel.fromMap(
      Map<String,dynamic>map){
    return ProviderUserModel(id:map['id'],fName: map['fName'], lName: map['lName'], email: map['email'], tagline: map['tagline'], description: map['description'], location: map['location'], rating: map['rating'], profileUrl: map['profileUrl'], phone: map['phone'], joined: DateTime.tryParse(map['joined'])!);
  }

  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
      "tagline": tagline,
      "description": description,
      "location": location,
      "rating": rating,
      "profileUrl": profileUrl,
      "phone": phone,
      "joined": joined.toIso8601String(),
    };
  }

}

ProviderUserModel demoProvider = ProviderUserModel(
  id: "1",
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
  joined: DateTime.utc(2014),
);

ProviderUserModel demoProvider1 = ProviderUserModel(
  id: "2",
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
  joined: DateTime.utc(2017),
);
