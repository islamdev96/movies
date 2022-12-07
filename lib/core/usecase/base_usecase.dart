import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseUseCase<Typ, Parameters> {
  Future<Either<Failure, Typ>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => throw UnimplementedError();
}
