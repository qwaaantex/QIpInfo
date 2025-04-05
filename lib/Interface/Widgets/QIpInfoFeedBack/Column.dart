import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/TextField.dart';
import 'package:flutter/material.dart';

class QIpInfoFeedBackColumn extends StatefulWidget {
    final AnimationController controller;

    const QIpInfoFeedBackColumn({super.key, required this.controller});

  @override
  State<QIpInfoFeedBackColumn> createState() => _QIpInfoFeedBackColumnState();
}

class _QIpInfoFeedBackColumnState extends State<QIpInfoFeedBackColumn> {
  @override
  Widget build(BuildContext context) {
      return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(onTap: () async {
              await widget.controller.reverse();
              if (mounted) {Navigator.pop(context);}
            },
              child: Icon(Icons.close, color: Theme.of(context).textTheme.titleLarge?.color,)),
            SizedBox(height: 5,),
            QIpInfoFeedBackTextField(controller: widget.controller,),
      ]);
      
  }
}