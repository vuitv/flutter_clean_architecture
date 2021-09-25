import '../../domain.dart';

abstract class PopupRepo {
  Future<Result<Popup>> getFloatPopup();
}
