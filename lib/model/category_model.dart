class CategoryModel {
  String id;
  String name;
  List subCategories;
  String coverUrl;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.subCategories,
      required this.coverUrl});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
        id: map['id'],
        name: map['name'],
        subCategories: map['subCategories'],
        coverUrl: map['coverUrl']);
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "subCategories": subCategories,
      "coverUrl": coverUrl,
    };
  }
}
