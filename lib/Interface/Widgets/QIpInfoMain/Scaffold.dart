import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoSettings.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Column.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class ScaffoldMainIpInfo extends StatelessWidget {
  const ScaffoldMainIpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: () {
        context.read<QIpInfoBloc>().add(QIpInfoBlocRemoveAll());
      }, icon: Icon(HugeIcons.strokeRoundedRemoveCircle, color: Theme.of(context).iconTheme.color,)),
        actions: [
        IconButton(onPressed: () {
          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
            return SlideTransition(position: animation1.drive(Tween(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0))), child: QIpInfoSettings(),);
          }));
        },
          icon:Icon(HugeIcons.strokeRoundedSettings03, color: Theme.of(context).iconTheme.color,))
      ],
        title: Text("QIpInfo", style: Theme.of(context).textTheme.titleMedium,),),
      body: QIpInfoMainColumn(),
    );
  }
}