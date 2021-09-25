import '../common/result.dart';
import '../entities/region.dart';

abstract class RegionRepo {
  Region? get region;

  Future<Result<List<Region>>> getRegions();

  List<Region> getRegionsLocal();

  Future<Result<Region>> getRegionById(int id);

  Future<bool> updateRegion(Region region);
}
