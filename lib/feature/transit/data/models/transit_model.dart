import 'package:flutter/material.dart';
import 'package:transit_app/feature/transit/domain/entities/transit_enities.dart';

class TransitModel extends Transit {
  TransitModel({
    @required String text,
    @required int numberInt,
  }) : super(text: text, numberInt: numberInt);

  factory TransitModel.fromJson(Map<String, dynamic> json) {
    return TransitModel(
      text: json['text'],
      numberInt: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': numberInt,
    };
  }
}
