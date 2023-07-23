import 'package:home_mate/model/provider_model.dart';

class ServiceModel {
  final String name;
  final String coverImg;
  final String category;
  final double rating;
  final int price;
  final ProviderUserModel provider;

  ServiceModel(
      {required this.name,
      required this.coverImg,
      required this.category,
      required this.price,
      required this.rating,
      required this.provider});
}

List<ServiceModel> demoServices = [
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 5,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 2.6,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 3.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 2.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
];
