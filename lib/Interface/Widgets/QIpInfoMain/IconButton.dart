import 'package:QIpInfo/Interface/Screens/QIpInfoSettings.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoMainIconButton extends StatelessWidget {
  const QIpInfoMainIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).canvasColor),
          child:IconButton(onPressed: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
              return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoSettings(),);
          }));
          }, icon: Icon(HugeIcons.strokeRoundedNext, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,))),
        SizedBox(height: 10,),
        Text("Что-то не подходит?", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,)
      ],);
  }
}