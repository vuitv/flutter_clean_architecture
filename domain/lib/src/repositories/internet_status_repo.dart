abstract class InternetStatusRepo {
  Future<bool> get isConnected;
  Stream<bool> onChange();
}
