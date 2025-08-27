import 'either.dart';
import 'failure.dart';


abstract interface class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}


class NoParams { const NoParams(); }