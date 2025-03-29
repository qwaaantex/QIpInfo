import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/Column.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoSettingsScaffold extends StatelessWidget {
  const QIpInfoSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(HugeIcons.strokeRoundedArrowLeft01, color: Theme.of(context).iconTheme.color,)),
      
        title: Text("Настройки", style: Theme.of(context).textTheme.titleMedium,),),
        body: QIpInfoSettingsColumn(),
    );
  }
}