import 'package:flutter/foundation.dart';

class MenuItem {
  final String id;
  final String image;
  final String name;
  final double price;

  MenuItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });
  MenuItem.noId({
    this.id = '',
    required this.image,
    required this.name,
    required this.price,
  });
  factory MenuItem.fromMap( String id, Map<String, dynamic> map) {
    return MenuItem(
      id: id,
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? 0.0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'price': price,
    };
  }
}
