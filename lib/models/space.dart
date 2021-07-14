class Space{
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final String city;
  final String country;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int numberOfKitchens;
  final int numberOfBedrooms;
  final int numberOfCupboards;

  Space({
    required this.id, 
    required this.name, 
    required this.imageUrl, 
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    this.address = '',
    this.phone = '',
    this.mapUrl = '',
    this.photos = const [],
    this.numberOfKitchens = 0,
    this.numberOfBedrooms = 0,
    this.numberOfCupboards = 0,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id : json['id'],
      name : json['name'],
      imageUrl :json['image_url'],
      price :json['price'],
      city :json['city'],
      country : json['country'],
      rating : json['rating'],
      address : json['address'],
      phone :json['phone'],
      mapUrl : json['map_url'],
      photos : json['photos'],
      numberOfKitchens :json['number_of_kitchens'],
      numberOfBedrooms : json['number_of_bedrooms'],
      numberOfCupboards : json['number_of_cupboards']
    );
  }

  // Space.fromJson(Map<String, dynamic>  json) 
  //   : id = json['id'],
  //     name = json['name'],
  //     imageUrl = json['image_url'],
  //     price = json['price'],
  //     city = json['city'],
  //     country = json['country'],
  //     rating = json['rating'],
  //     address = json['address'],
  //     phone = json['phone'],
  //     mapUrl = json['map_url'],
  //     photos = json['photos'],
  //     numberOfKitchens = json['number_of_kitchens'],
  //     numberOfBedrooms = json['number_of_bedrooms'],
  //     numberOfCupboards = json['number_of_cupboards'];

}