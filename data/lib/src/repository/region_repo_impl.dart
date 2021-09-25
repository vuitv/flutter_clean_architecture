import 'package:domain/domain.dart';

import '../data_source/local/shared_preferences_store.dart';
import '../data_source/remote/regions_api.dart';
import '../models/region_model.dart';
import 'base/base_repository.dart';

class RegionRepoImpl extends BaseRepository implements RegionRepo {
  final RegionApi _regionApi;
  final SharedPrefsStore _prefs;

  List<Region> _defaultRegion = Region.defaultRegions;

  Region? _region = null;

  RegionRepoImpl(this._regionApi, this._prefs);

  @override
  Region? get region => _region ?? _prefs.getRegion();

  @override
  Future<Result<List<Region>>> getRegions() async {
    final result = await safeApiCall<List<Region>>(
      _regionApi.regions(),
      mapper: (data) => RegionModel.fromList(data),
    );
    if (result.isSuccessful) {
      _defaultRegion = (result as Success<List<Region>>).data;
    }
    return result;
  }

  @override
  List<Region> getRegionsLocal() => _defaultRegion;

  @override
  Future<bool> updateRegion(Region region) async {
    _prefs.saveRegion(region);
    _region = region;
    return true;
  }

  @override
  Future<Result<Region>> getRegionById(int id) {
    return safeApiCall<Region>(
      _regionApi.regionById(id),
      mapper: (data) => RegionModel.fromJson(data),
    );
  }
}
