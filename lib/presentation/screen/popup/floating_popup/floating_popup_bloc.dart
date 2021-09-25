import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingPopupBloc extends BlocBase<Popup?> {
  FloatingPopupBloc(this.getFloatPopup) : super(null);

  final GetFloatPopup getFloatPopup;

  void init() async {
    final result = await getFloatPopup();
    result.when(success: (popup) {
      if (popup.status == 'active') emit(popup);
    });
  }
}
