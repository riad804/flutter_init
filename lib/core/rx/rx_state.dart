import '../failure.dart';

sealed class RxState<T> {
  const RxState();
}
class RxIdle<T> extends RxState<T> { const RxIdle(); }
class RxLoading<T> extends RxState<T> { const RxLoading(); }
class RxData<T> extends RxState<T> { final T data; const RxData(this.data); }
class RxError<T> extends RxState<T> { final Failure failure; const RxError(this.failure); }