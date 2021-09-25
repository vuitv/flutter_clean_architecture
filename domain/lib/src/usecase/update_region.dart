import '../entities/region.dart';
import '../repositories/region_repo.dart';

class UpdateRegion {
  final RegionRepo _regionRepo;

  const UpdateRegion(this._regionRepo);

  Future<bool> call(Region region) async {
    return await _regionRepo.updateRegion(region);
  }
}
