import 'package:rx_state_manager/rx_state_manager.dart';

import 'either.dart';


abstract interface class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}


class NoParams { const NoParams(); }