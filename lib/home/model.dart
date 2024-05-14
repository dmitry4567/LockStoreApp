class Product {
  final int id;
  final String title;
  final int rate;
  final int price;
  final int oldPrice;
  final List<Photo> photos;
  final String material;

  Product({
    required this.id,
    required this.title,
    required this.rate,
    required this.price,
    required this.oldPrice,
    required this.photos,
    required this.material,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      rate: json['rate'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      photos: List<Photo>.from(
        json['photoItems'].map((photo) => Photo.fromJson(photo)),
      ),
      material: json['material'] != null ? json['material']['name'] : "");
}

class Photo {
  final int id;
  final String fileName;

  Photo({
    required this.id,
    required this.fileName,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'],
        fileName: json['fileName'],
      );
}
