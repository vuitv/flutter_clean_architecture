import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBloc extends BlocBase {
  final GetShoppingScreenSetting getScreenSetting;

  ShoppingBloc(this.getScreenSetting) : super(null);

  Future getPageSetting() async {
    final result = await getScreenSetting();
    print('isSuccessful: ${result.isSuccessful}');
    result.when(
      success: (data) => print('data: ${data.text}'),
      error: (error) => print(error.message),
    );
  }
}
