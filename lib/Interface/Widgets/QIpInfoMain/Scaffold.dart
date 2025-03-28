import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Column.dart';
import 'package:flutter/material.dart';

class ScaffoldMainIpInfo extends StatelessWidget {
  const ScaffoldMainIpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QIpInfo", style: Theme.of(context).textTheme.titleMedium,),),
      body: QIpInfoMainColumn(),
    );
  }
}