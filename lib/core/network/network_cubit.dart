import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/core/network/network_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;

  NetworkCubit() : super(const NetworkState.initial()) {
    _subscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      // إذا كانت القائمة تحتوي على none، فهذا يعني انقطاع الاتصال تماماً
      if (results.contains(ConnectivityResult.none)) {
        emit(NetworkState.disConnected());
      } else {
        emit(NetworkState.connected());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
