class Product {
  final String title;
  final int rate;
  final int price;
  final int oldPrice;
  final List<Photo> photos;

  Product({
    required this.title,
    required this.rate,
    required this.price,
    required this.oldPrice,
    required this.photos,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json['title'],
        rate: json['rate'],
        price: json['rate'],
        oldPrice: json['oldPrice'],
        photos: List<Photo>.from(
          json['photoItems'].map((photo) => Photo.fromJson(photo)),
        ),
      );
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
