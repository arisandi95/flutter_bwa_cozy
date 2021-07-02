class City{
  final int id;
  final String name;
  final String imageUrl;
  final bool isPopular;

  City({
    required this.id, 
    required this.imageUrl, 
    required this.name,
    this.isPopular = false,
  });
}