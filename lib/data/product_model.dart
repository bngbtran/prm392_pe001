import '../../domain/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.rating,
    required super.description,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}