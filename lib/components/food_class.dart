// ignore_for_file: unused_element

class Food {
  final String imagePath;
  final String foodName;
  final String price;
  final String rating;
  Food({
    required this.imagePath,
    required this.foodName,
    required this.price,
    required this.rating,
  });
  String get _name =>foodName;
  String get _imagePath =>imagePath;
  String get _price =>price;
  String get _rating =>rating;
}
