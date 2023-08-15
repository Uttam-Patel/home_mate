

class ServiceModel {
  String id;
  String name;
  String description;
  String category;
  String subCategory;
  String coverUrl;
  double price;
  double rating;
  int ratedBy;
  Map<String,dynamic> provider;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.subCategory,
    required this.ratedBy,
    required this.rating,
    required this.coverUrl,
    required this.price,
    required this.provider,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        category: map['category'],
        subCategory: map['subCategory'],
        ratedBy: map['ratedBy'],
        rating: map['rating'],
        coverUrl: map['coverUrl'],
        price: map['price'],
        provider: map['provider']);
  }

  Map<String,dynamic> toMap(){
    return {
    "id": id,
    "name": name,
    "description": description,
    "category": category,
    "subCategory": subCategory,
    "ratedBy": ratedBy,
    "rating": rating,
    "coverUrl": coverUrl,
    "price": price,
    "provider": provider,
    };
  }
}
