import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/IconButton.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/License.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/List.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Text.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/TextField.dart';
import 'package:flutter/material.dart';


class QIpInfoMainColumn extends StatefulWidget {
  const QIpInfoMainColumn({super.key});

  @override
  State<QIpInfoMainColumn> createState() => _QIpInfoMainColumnState();
}

class _QIpInfoMainColumnState extends State<QIpInfoMainColumn> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QIpInfoMainText(),
        SizedBox(height: 20,),
        Center(child: QIpInfoMainTextField(controllerAnim: controller,)),
        SizedBox(height: 15,),
        Spacer(),
        Align(alignment: Alignment.topCenter,
        child: QIpInfoMainList(controller: controller,)),
        SizedBox(height: 15,),
        Spacer(),
        QIpInfoMainIconButton(),
        SizedBox(height: 15,),
        QIpInfoMainLicense(),
        SizedBox(height: 10,),
      ],
    );
  }
}