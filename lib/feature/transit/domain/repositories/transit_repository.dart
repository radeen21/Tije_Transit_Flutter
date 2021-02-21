import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import 'package:transit_app/feature/transit/domain/entities/transit_enities.dart';

abstract class TransitRepository {
  Future<Either<Failure, Transit>> getTransit();
}
