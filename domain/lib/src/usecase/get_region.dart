import '../entities/region.dart';
import '../repositories/region_repo.dart';
import 'base/use_case.dart';

class GetRegion implements UseCase {
  final RegionRepo _regionRepo;

  const GetRegion(this._regionRepo);

  @override
  Region? call() => _regionRepo.region;
}
