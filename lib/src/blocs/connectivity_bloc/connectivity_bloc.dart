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

  ConnectivityBloc() : super(ConnectivityDisconnected()) {
    on<ConnectivityEvent>((event, emit) {
      if (event is ConnectivityEmit) {
        _onConnectivityEmit(event, emit);
        /*_connectivity.onConnectivityChanged.listen((event) {
          _updateConnectionStatus(event, emit);*/
        //});
      }
    });
  }

  Future<void> _onConnectivityEmit(
      ConnectivityEmit event, Emitter<ConnectivityState> emit) async {
    try {
      await _connectivity.checkConnectivity();

      _connectivity.onConnectivityChanged.listen((event) {
        _updateConnectionStatus(event, emit);
      });
    } catch (e) {
      _logger.e(e);
      emit(ConnectivityFail(error: e.toString()));
    }
  }

  void _updateConnectionStatus(
      ConnectivityResult result, Emitter<ConnectivityState> emit) {
    switch (result) {
      case ConnectivityResult.none:
        _logger.d('Is connected');
        emit(ConnectivityDisconnected());
        break;
      default:
        _logger.d('Is not connected');
        emit(ConnectivityConnected());
        break;
    }
/*    setState(() {
      _connectionStatus = result;
    });*/
  }
}
