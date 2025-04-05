import 'package:QIpInfo/Interface/Widgets/QIpInfoConfidenty/Image.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoConfidenty/Text.dart';
import 'package:flutter/material.dart';


class QIpInfoConfidentyColumn extends StatelessWidget {
  const QIpInfoConfidentyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            QIpInfoConfidentyImage(),
            SizedBox(height: 10),
            QIpInfoConfidentyText()
            
          ],
        ),
      ),
    );
  }
}
