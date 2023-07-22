class CategoryModel {
  final String name;
  final String iconUrl;

  CategoryModel({
    required this.name,
    required this.iconUrl,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
    name: "Plumber",
    iconUrl: "assets/icons/plumber.png",
  ),
  CategoryModel(
    name: "Carpenter",
    iconUrl: "assets/icons/carpenter.png",
  ),
  CategoryModel(
    name: "Painting",
    iconUrl: "assets/icons/painting.png",
  ),
  CategoryModel(
    name: "Salon",
    iconUrl: "assets/icons/salon.png",
  ),
  CategoryModel(
    name: "Smart Home",
    iconUrl: "assets/icons/smarthome.png",
  ),
  CategoryModel(
    name: "AC Repair",
    iconUrl: "assets/icons/acrepair.png",
  ),
  CategoryModel(
    name: "Security",
    iconUrl: "assets/icons/security.png",
  ),
  CategoryModel(
    name: "AC Repair",
    iconUrl: "assets/icons/pestcontrol.png",
  ),
];
