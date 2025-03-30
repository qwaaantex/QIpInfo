import 'package:QIpInfo/Interface/Widgets/QIpInfoConfidenty/Column.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoConfidentyScaffold extends StatelessWidget {
  const QIpInfoConfidentyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(HugeIcons.strokeRoundedArrowLeft01), color: Theme.of(context).iconTheme.color,),
        title: Text("Конфиденциальность", style: Theme.of(context).textTheme.titleMedium,), backgroundColor: Theme.of(context).scaffoldBackgroundColor,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: QIpInfoConfidentyColumn(),
    );
  }
}