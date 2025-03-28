import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/License.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Text.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/TextField.dart';
import 'package:flutter/material.dart';


class QIpInfoMainColumn extends StatelessWidget {
  const QIpInfoMainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QIpInfoMainText(),
        SizedBox(height: 20,),
        QIpInfoMainTextField(),
        Spacer(),
        QIpInfoMainLicense(),
        SizedBox(height: 40,)
    ],);
  }
}