import 'package:flutter/material.dart';

class QIpInfoConfidentyColumn extends StatelessWidget {
  const QIpInfoConfidentyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height;
    List confidenty = ["Публичный", "Личный"];
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Container(
          width: width,
          height: height * 0.3,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor), child: ListView.builder(scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)), child: IconButton(onPressed: () {}, icon: Icon(Icons.confirmation_num),));
          }),)
      ],),
    );
  }
}