import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:transit_app/feature/transit/data/models/transit_model.dart';
import '../../../../core/error/exception.dart';

abstract class TransitDataSources {
  Future<TransitModel> getTransit();
}

class NumberTriviaRemoteDataSourceImpl implements TransitDataSources {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

  @override
  Future<TransitModel> getTransit() =>
      _getTransitFromUrl('http://numbersapi.com/random');

  Future<TransitModel> _getTransitFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return TransitModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
