import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class ConnectivityService {
  final _connectivity = Connectivity();
  final _controller = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get connectivityStream => _controller.stream;

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen(_updateStatus);
    _checkInitialStatus();
  }

  Future<void> _checkInitialStatus() async {
    final result = await _connectivity.checkConnectivity();
    _updateStatus(result);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    _controller.add(result.contains(ConnectivityResult.none));
  }

  void dispose() {
    _controller.close();
  }
}