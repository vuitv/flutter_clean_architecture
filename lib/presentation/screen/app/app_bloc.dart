import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../popup/region/region_dialog.dart';

part 'app_state.dart';

class AppBloc extends BlocBase<AppState> {
  final ApiErrorHandle apiErrorHandle;
  final GetRegions getRegions;
  final GetRegion region;

  AppBloc({
    required this.apiErrorHandle,
    required this.getRegions,
    required this.region,
  }) : super(AppState(
          region: region(),
        )) {
    init();
  }

  void init() {
    apiErrorHandling();
    getAppRegions();
  }

  void apiErrorHandling() {
    apiErrorHandle(InterceptorsWrapper(
      onError: (error, handle) {
        if (error.type == DioErrorType.response) {
          //Todo Logout user case
        }
        return handle.next(error);
      },
    ));
  }

  Future getAppRegions() async {
    final result = await getRegions();
    result.when(
      success: (data) {
        if (region() == null) {
          RegionDialog.show();
        }
      },
    );
  }

  Future updateRegions(Region region) async {
    emit(state.copyWith(region: region));
  }
}
