import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class QIpInfoMainError extends StatelessWidget {
  const QIpInfoMainError({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QProvider>(context).controller;

    return Center(
      child: Column(
        key:  ValueKey<dynamic>(context.read<QIpInfoBloc>().state),
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Упc, похоже произошла неизвестная ошибка!", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
      SizedBox(height: 20,),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
            context.read<QIpInfoBloc>().add(QIpInfoBlocUserInfo(controller.text));
          }, icon:  Icon(HugeIcons.strokeRoundedReload, color: Theme.of(context).textTheme.titleLarge?.color, size: 30,)),
        ),
      ),
                      
                      ],),
    );
  }
}