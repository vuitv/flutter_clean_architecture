import '../common/result.dart';
import '../entities/region.dart';
import '../repositories/region_repo.dart';
import 'base/use_case.dart';

class GetRegions implements UseCaseResult<List<Region>, NoParams> {
  final RegionRepo _regionRepo;

  const GetRegions(this._regionRepo);

  @override
  Future<Result<List<Region>>> call({NoParams? params}) async {
    return await _regionRepo.getRegions();
  }
}
