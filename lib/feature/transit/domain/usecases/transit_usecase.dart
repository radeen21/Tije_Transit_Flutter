import 'package:dartz/dartz.dart';

import 'package:transit_app/core/error/failure.dart';
import 'package:transit_app/core/usecases/usescase.dart';
import 'package:transit_app/feature/transit/domain/entities/transit_enities.dart';
import 'package:transit_app/feature/transit/domain/repositories/transit_repository.dart';

class GetTransitUsecase implements UseCase<Transit, NoParams> {
  final TransitRepository repository;

  GetTransitUsecase(this.repository);

  @override
  Future<Either<Failure, Transit>> call(NoParams params) async {
    return await repository.getTransit();
  }
}
