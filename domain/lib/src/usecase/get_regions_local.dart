import '../entities/region.dart';
import '../repositories/region_repo.dart';
import 'base/use_case.dart';

class GetRegionsLocal implements UseCase {
  final RegionRepo _regionRepo;

  const GetRegionsLocal(this._regionRepo);

  @override
  List<Region> call() => _regionRepo.getRegionsLocal();
}
