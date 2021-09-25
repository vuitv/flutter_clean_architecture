import '../../domain.dart';

class GetFloatPopup extends UseCaseResult<Popup, NoParams> {
  final PopupRepo _repo;

  GetFloatPopup(this._repo);

  @override
  Future<Result<Popup>> call({NoParams? params}) => _repo.getFloatPopup();
}
