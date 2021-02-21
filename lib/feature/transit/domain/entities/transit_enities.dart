import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Transit extends Equatable {
  final String text;
  final int numberInt;

  Transit({@required this.text, @required this.numberInt});

  @override
  List<Object> get props => [text, numberInt];
}
