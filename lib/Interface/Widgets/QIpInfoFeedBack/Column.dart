import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/TextField.dart';
import 'package:flutter/material.dart';

class QIpInfoFeedBackColumn extends StatefulWidget {
  const QIpInfoFeedBackColumn({super.key});

  @override
  State<QIpInfoFeedBackColumn> createState() => _QIpInfoFeedBackColumnState();
}

class _QIpInfoFeedBackColumnState extends State<QIpInfoFeedBackColumn> {
  @override
  Widget build(BuildContext context) {
      return Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min,
      children: [
       QIpInfoFeedBackTextField(),
        ],
      
    );
  }
}