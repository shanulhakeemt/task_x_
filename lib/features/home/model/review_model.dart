// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewModel {
  final int user_id;
  final int rating;
  final String comment;
  ReviewModel({
    required this.user_id,
    required this.rating,
    required this.comment,
  });

  ReviewModel copyWith({
    int? user_id,
    int? rating,
    String? comment,
  }) {
    return ReviewModel(
      user_id: user_id ?? this.user_id,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'rating': rating,
      'comment': comment,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      user_id: map['user_id']??0,
      rating: map['rating']??0,
      comment: map['comment']??'',
    );
  }


}
