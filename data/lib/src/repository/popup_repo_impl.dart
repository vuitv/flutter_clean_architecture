import 'package:domain/domain.dart';

import '../data_source/remote/popup_api.dart';
import '../models/popup_model.dart';
import 'base/base_repository.dart';

class PopupRepoImpl extends BaseRepository implements PopupRepo {
  final PopupApi _popupApi;

  PopupRepoImpl(this._popupApi);

  @override
  Future<Result<Popup>> getFloatPopup() {
    return safeApiCall<Popup>(
      _popupApi.getFloatPopup(),
      mapper: (data) => PopupModel.fromJson(data),
    );
  }
}
