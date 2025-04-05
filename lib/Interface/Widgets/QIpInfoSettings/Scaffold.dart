import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/Column.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/IconButton.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoSettingsScaffold extends StatelessWidget {
  const QIpInfoSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(HugeIcons.strokeRoundedArrowLeft01, color: Theme.of(context).iconTheme.color,)),
      
        title: Text("Настройки", style: Theme.of(context).textTheme.titleMedium,),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QIpInfoSettingsColumn(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                child: QIpInfoSettingsIconButton(),
              )
            ],
          ),
        ),
    );
  }
}