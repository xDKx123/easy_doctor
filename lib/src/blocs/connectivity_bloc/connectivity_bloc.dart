import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  //late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  final Logger _logger = CustomLogger().getLogger();

  ConnectivityBloc() : super(const ConnectivityUnknown()) {
    on<ConnectivityEvent>((event, emit) async {
      if (event is ConnectivityEmit) {
        await _onConnectivityEmit(event, emit);
      }
      if (event is ConnectivityChange) {
        await _updateConnectionStatus(event.connectivity, emit);
      }
    });
  }

  Future<void> _onConnectivityEmit(
      ConnectivityEmit event, Emitter<ConnectivityState> emit) async {
    try {
      await _connectivity.checkConnectivity();

      _connectivity.onConnectivityChanged.listen((event) {
        //_updateConnectionStatus(event, emit);
        add(ConnectivityChange(connectivity: event));
      });
    } catch (e) {
      _logger.e(e);
      emit(ConnectivityFail(error: e.toString()));
    }
  }

  Future<void> _updateConnectionStatus(
      ConnectivityResult result, Emitter<ConnectivityState> emit) async {
    switch (result) {
      case ConnectivityResult.none:
        emit(ConnectivityDisconnected());
        break;
      default:
        emit(const ConnectivityConnected());
        break;
    }
/*    setState(() {
      _connectionStatus = result;
    });*/
  }
}
