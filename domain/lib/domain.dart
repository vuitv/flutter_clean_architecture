library domain;

import 'src/di/locator.dart';

export 'src/common/error_type.dart';
export 'src/common/result.dart';
export 'src/entities/list_response.dart';
export 'src/entities/metadata.dart';
export 'src/entities/popup.dart';
export 'src/entities/region.dart';
export 'src/entities/screen_setting.dart';
export 'src/entities/validator.dart';
export 'src/repositories/api_error_handler_repo.dart';
export 'src/repositories/internet_status_repo.dart';
export 'src/repositories/popup_repo.dart';
export 'src/repositories/region_repo.dart';
export 'src/repositories/screen_setting_repo.dart';
export 'src/usecase/api_error_handler.dart';
export 'src/usecase/base/use_case.dart';
export 'src/usecase/check_internet_status.dart';
export 'src/usecase/get_float_popup.dart';
export 'src/usecase/get_home_screen_setting.dart';
export 'src/usecase/get_region.dart';
export 'src/usecase/get_regions.dart';
export 'src/usecase/get_regions_local.dart';
export 'src/usecase/get_shopping_screen_setting.dart';
export 'src/usecase/update_region.dart';

class Domain {
  static Future init() async {
    setupLocator();
  }
}
