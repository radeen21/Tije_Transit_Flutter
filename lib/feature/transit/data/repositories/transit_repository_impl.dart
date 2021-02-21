import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/core/error/exception.dart';
import 'package:transit_app/core/error/failure.dart';
import 'package:transit_app/core/network/network_info.dart';
import 'package:transit_app/feature/transit/data/datasources/transit_data_source.dart';
import 'package:transit_app/feature/transit/domain/entities/transit_enities.dart';
import 'package:transit_app/feature/transit/domain/repositories/transit_repository.dart';

typedef Future<Transit> _ConcreteOrRandomChooser();

class TransitRepositoryImpl extends TransitRepository {
  final TransitDataSources transitDataSources;
  final NetworkInfo networkInfo;

  TransitRepositoryImpl(
      {@required this.transitDataSources, @required this.networkInfo});

  @override
  Future<Either<Failure, Transit>> getTransit() async {
    return await _getTransit(() {
      return transitDataSources.getTransit();
    });
  }

  // ignore: missing_return
  Future<Either<Failure, Transit>> _getTransit(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransit = await getConcreteOrRandom();
        return Right(remoteTransit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
