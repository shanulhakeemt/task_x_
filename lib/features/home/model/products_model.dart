// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  final int product_id;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String image;
  final int discount;
  final bool availability;
  final String brand;
  final String category;
  final double rating;
  final List<Map<String,dynamic>> reviews;
  ProductModel({
    required this.product_id,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviews,
  });


  


  ProductModel copyWith({
    int? product_id,
    String? name,
    String? description,
    double? price,
    String? unit,
    String? image,
    int? discount,
    bool? availability,
    String? brand,
    String? category,
    double? rating,
    List<Map<String,dynamic>>? reviews,
  }) {
    return ProductModel(
      product_id: product_id ?? this.product_id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      availability: availability ?? this.availability,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': product_id,
      'name': name,
      'description': description,
      'price': price,
      'unit': unit,
      'image': image,
      'discount': discount,
      'availability': availability,
      'brand': brand,
      'category': category,
      'rating': rating,
      'reviews': reviews,
    };
  }

  // factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
  //   return ProductModel(
  //     product_id: map['product_id'] ??0,
  //     name: map['name'] ??'',
  //     description: map['description'] ??'',
  //     price: map['price'] ??0.0,
  //     unit: map['unit'] ??'',
  //     image: map['image'] ??'',
  //     discount: map['discount'] ??0,
  //     availability: map['availability'] ??false,
  //     brand: map['brand'] ??'',
  //     category: map['category'] ??'',
  //     rating: map['rating'] ??0.0,
  //     reviews: map["reviews"]??[],
  //   );
  // }
factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
  return ProductModel(
    product_id: map['product_id'] ?? 0,
    name: map['name'] ?? '',
    description: map['description'] ?? '',
    price: (map['price'] is double) ? map['price'] : (map['price']?.toDouble() ?? 0.0), // Safely convert to double
    unit: map['unit'] ?? '',
    image: map['image'] ?? '',
    discount: map['discount'] ?? 0,
    availability: map['availability'] ?? false,
    brand: map['brand'] ?? '',
    category: map['category'] ?? '',
    rating: (map['rating'] is double) ? map['rating'] : (map['rating']?.toDouble() ?? 0.0), // Safely convert to double
    reviews: List<Map<String, dynamic>>.from(
      (map['reviews'] as List? ?? []).map((item) => Map<String, dynamic>.from(item)),
    ), // Ensure reviews are parsed as List<Map<String, dynamic>>
  );
}

  
}
