import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';

/// Base contract for every use case in the domain layer.
///
/// A use case wraps a single business action and always resolves to
/// [Either] a [Failure] or the expected [Output].
abstract class UseCase<Output, Params> {
  const UseCase();

  Future<Either<Failure, Output>> call(Params params);
}

/// Used by use cases that don't need any input.
class NoParams {
  const NoParams();
}
