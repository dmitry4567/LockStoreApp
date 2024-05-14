class CartItem {
  int? id;
  int? quantity;
  int? priceProduct;
  Product? product;

  CartItem({this.id, this.quantity, this.priceProduct, this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['Quantity'];
    priceProduct = json['priceProduct'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Quantity'] = this.quantity;
    data['priceProduct'] = this.priceProduct;
    if (product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  int? rate;
  int? price;
  int? oldPrice;
  List<PhotoItems>? photoItems;

  Product(
      {this.id,
      this.title,
      this.rate,
      this.price,
      this.oldPrice,
      this.photoItems});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rate = json['rate'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    if (json['photoItems'] != null) {
      photoItems = <PhotoItems>[];
      json['photoItems'].forEach((v) {
        photoItems!.add(PhotoItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['oldPrice'] = this.oldPrice;
    if (this.photoItems != null) {
      data['photoItems'] = this.photoItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhotoItems {
  int? id;
  String? fileName;

  PhotoItems({this.id, this.fileName});

  PhotoItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    return data;
  }
}