import '../common/result.dart';
import '../entities/screen_setting.dart';
import '../repositories/screen_setting_repo.dart';
import 'base/use_case.dart';

class GetShoppingScreenSetting implements UseCaseResult<ScreenSetting, NoParams> {
  final ScreenSettingRepo _repo;

  GetShoppingScreenSetting(this._repo);

  @override
  Future<Result<ScreenSetting>> call({NoParams? params}) async {
    return await _repo.getShoppingSetting();
  }
}
