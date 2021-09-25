import '../repositories/internet_status_repo.dart';
import 'base/use_case.dart';

class CheckInternetStatus implements UseCase {
  final InternetStatusRepo _repo;

  CheckInternetStatus(this._repo);

  @override
  Stream<bool> call() => _repo.onChange();
}
