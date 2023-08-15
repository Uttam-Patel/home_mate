//Simple User Model
class UserModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String profileUrl;
  final String location;
  final String phone;
  final String type = "user";
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      fName: map['fName'],
      lName: map['lName'],
      email: map['email'],
      location: map['location'],
      profileUrl: map['profileUrl'],
      phone: map['phone'],
      joined: DateTime.tryParse(map['joined'])!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
      "location": location,
      "profileUrl": profileUrl,
      "phone": phone,
      "joined": joined.toIso8601String(),
      "type": type,
    };
  }
}

//Provider Model
class ProviderModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String profileUrl;
  final String location;
  final String phone;
  final String type = "provider";
  final DateTime joined;
  final double rating;
  final String tagline;
  final String description;
  final int ratedBy;

  ProviderModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.location,
    required this.profileUrl,
    required this.phone,
    required this.joined,
    required this.tagline,
    required this.description,
    required this.rating,
    required this.ratedBy,
  });

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
        id: map['id'],
        fName: map['fName'],
        lName: map['lName'],
        email: map['email'],
        location: map['location'],
        profileUrl: map['profileUrl'],
        phone: map['phone'],
        joined: DateTime.tryParse(map['joined'])!,
        tagline: map['tagline'],
        description: map['description'],
        rating: map['rating'],
        ratedBy: map['ratedBy']);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
      "location": location,
      "profileUrl": profileUrl,
      "phone": phone,
      "joined": joined.toIso8601String(),
      "type": type,
      "tagline": tagline,
      "description": description,
      "rating": rating,
      "ratedBy":ratedBy,
    };
  }
}

//Admin Model
class AdminModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String profileUrl;
  final String phone;
  final String type = "admin";
  final DateTime joined;

  AdminModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.profileUrl,
    required this.phone,
    required this.joined,
  });

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'],
      fName: map['fName'],
      lName: map['lName'],
      email: map['email'],
      profileUrl: map['profileUrl'],
      phone: map['phone'],
      joined: DateTime.tryParse(map['joined'])!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
      "profileUrl": profileUrl,
      "phone": phone,
      "joined": joined.toIso8601String(),
      "type": type,
    };
  }
}
