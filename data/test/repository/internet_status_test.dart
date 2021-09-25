import 'package:data/src/repository/internet_status_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InternetStatusRepoImpl internetStatus;

  setUp(() {
    internetStatus = InternetStatusRepoImpl();
  });

  test('Un awaited isConnected', () async {
    final result = internetStatus.isConnected;
    expect(result, isA<Future<bool>>());
  });

  test('Awaited isConnected', () async {
    final result = await internetStatus.isConnected;
    expect(result, isA<bool>());
  });
}
