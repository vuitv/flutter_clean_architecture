import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/app/app_bloc.dart';
import '../screen/popup/region/region_dialog.dart';

class ChooseRegion extends StatelessWidget {
  const ChooseRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: RegionDialog.show,
      child: Row(children: [
        BlocBuilder<AppBloc, AppState>(
            buildWhen: (prev, current) => prev.region != current.region,
            builder: (_, state) => Text(
                  state.regionName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).disabledColor,
                  ),
                )),
        const SizedBox(width: 2),
        Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).disabledColor,
          size: 16,
        ),
      ]),
    );
  }
}
