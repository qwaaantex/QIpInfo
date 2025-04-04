import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QIpInfoMainTittle extends StatelessWidget {
  const QIpInfoMainTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Результаты поиска по запросу:", style: Theme.of(context).textTheme.displayMedium),
      Text(context.select((QProvider provider)  => provider.controller.text.toString()), style: Theme.of(context).textTheme.headlineMedium)
    ],);
  }
}