import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = _initial;

  const factory NetworkState.connected() = _connected;
  const factory NetworkState.disConnected() = _disConnected;
}
