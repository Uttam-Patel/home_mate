class UserModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String profileUrl;
  final String location;
  final String phone;
  final DateTime joined;

  UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.location,
    required this.profileUrl,
    required this.phone,
    required this.joined,
  });

  factory UserModel.fromMap(
      Map<String,dynamic>map){
    return UserModel(id:map['id'],fName: map['fName'], lName: map['lName'], email: map['email'], location: map['location'],  profileUrl: map['profileUrl'], phone: map['phone'], joined: DateTime.tryParse(map['joined'])!);
  }

  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
      "location": location,
      "profileUrl": profileUrl,
      "phone": phone,
      "joined": joined.toIso8601String(),
    };
  }

}
