import 'package:rxdart/rxdart.dart';
import '../failure.dart';
import 'rx_state.dart';


abstract class RxViewModel<T> {
  final _state = BehaviorSubject<RxState<T>>.seeded(const RxIdle());
  Stream<RxState<T>> get state => _state.stream;
  RxState<T> get current => _state.value;


  void setIdle() => _state.add(const RxIdle());
  void setLoading() => _state.add(const RxLoading());
  void setData(T data) => _state.add(RxData<T>(data));
  void setError(Failure f) => _state.add(RxError<T>(f));


  final _subscriptions = CompositeSubscription();


  void bind(Stream<T> source) {
    _subscriptions.add(source.listen(
          (data) => setData(data),
      onError: (e, st) => setError(UnknownFailure(e.toString(), error: e, stackTrace: st)),
    ));
  }


  void dispose() {
    _subscriptions.dispose();
    _state.close();
  }


}