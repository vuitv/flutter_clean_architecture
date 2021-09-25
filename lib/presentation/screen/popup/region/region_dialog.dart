import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/locator.dart';
import '../../../routes/app_routes.dart';
import '../../app/app_bloc.dart';
import 'region_bloc.dart';

class RegionDialog extends StatelessWidget {
  const RegionDialog({Key? key}) : super(key: key);

  static Future<T?> show<T>({
    BuildContext? context,
    bool barrierDismissible = false,
  }) async {
    final appContext = AppRoutes.navigatorKey.currentState?.overlay?.context;
    if ((context ?? appContext) == null) throw 'Context call null';
    final result = await showDialog<T>(
      context: (context ?? appContext)!,
      barrierDismissible: barrierDismissible,
      builder: (_) => BlocProvider<RegionBloc>(
        create: (_) => locator<RegionBloc>(),
        child: const RegionDialog(),
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SimpleDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(15),
        title: const RegionTitle(),
        children: [
          Container(
            color: Colors.white,
            child: BlocBuilder<RegionBloc, bool>(
              builder: (context, state) {
                return Row(children: <Widget>[
                  Expanded(
                    child: RegionButton(
                      region: context.read<RegionBloc>().getRegions.first,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: RegionButton(
                      region: context.read<RegionBloc>().getRegions.last,
                    ),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RegionTitle extends StatelessWidget {
  const RegionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          )),
      child: Row(
        children: <Widget>[
          Icon(
            CupertinoIcons.location_solid,
            size: 18,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
            Strings.tr.titleLocation,
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }
}

class RegionButton extends StatelessWidget {
  final Region region;

  const RegionButton({
    Key? key,
    required this.region,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
        primary: Colors.white,
        onPrimary: Theme.of(context).primaryColor,
        //textStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: () async {
        final result = await context.read<RegionBloc>().updateRegion(region);
        if (result) {
          Navigator.of(context).pop();
          context.read<AppBloc>().updateRegions(region);
        }
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          region.name,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
