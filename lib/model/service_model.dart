import 'package:home_mate/model/provider_model.dart';

class ServiceModel {
  final String name;
  final String coverImg;
  final String category;
  final String description;
  final double rating;
  final int price;
  final ProviderUserModel provider;

  ServiceModel(
      {required this.name,
      required this.coverImg,
      required this.category,
      required this.description,
      required this.price,
      required this.rating,
      required this.provider});
}

List<ServiceModel> demoServices = [
  ServiceModel(
    name: "Repair Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 5,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 2.6,
    provider: demoProvider1,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 3.3,
    provider: demoProvider1,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 2.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 4.3,
    provider: demoProvider1,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 4.3,
    provider: demoProvider1,
  ),
  ServiceModel(
    name: "Repait Broken ACs",
    coverImg: "assets/images/servicecover4.png",
    category: "AC Repair",
    description:
        "Donec tincidunt sit amet sem id lobortis. Quisque ut est vitae purus tincidunt lacinia nec vitae enim. Vestibulum bibendum lacinia tempus. Donec tempus dui elit, sit amet condimentum enim tempor quis. Maecenas eros magna, dictum quis sodales sit amet, ornare quis felis. Interdum et malesuada fames ac ante ipsum primis.",
    price: 150,
    rating: 4.3,
    provider: demoProvider,
  ),
];
