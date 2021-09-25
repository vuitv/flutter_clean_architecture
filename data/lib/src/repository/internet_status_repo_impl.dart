import 'dart:async';

import 'package:domain/domain.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetStatusRepoImpl implements InternetStatusRepo {
  final _connectivity = InternetConnectionChecker();

  @override
  Stream<bool> onChange() => _connectivity.onStatusChange.transform(
        StreamTransformer.fromHandlers(handleData: (status, sink) {
          if (status == InternetConnectionStatus.connected) {
            sink.add(true);
          }
          sink.add(false);
        }),
      );

  @override
  Future<bool> get isConnected async => await _connectivity.hasConnection;
}
