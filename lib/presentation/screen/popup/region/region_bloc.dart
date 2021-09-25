import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBloc extends BlocBase<bool> {
  RegionBloc(
    this._getRegionsLocal,
    this._updateRegion,
  ) : super(false);

  final GetRegionsLocal _getRegionsLocal;
  final UpdateRegion _updateRegion;

  List<Region> get getRegions => _getRegionsLocal();

  Future<bool> updateRegion(Region region) async {
    //Todo xử lý status loading
    final result = await _updateRegion(region);
    return result;
  }
}
