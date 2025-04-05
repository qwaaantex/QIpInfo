import 'package:flutter/material.dart';

class QIpInfoConfidentyTittle extends StatelessWidget {
  const QIpInfoConfidentyTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(text: TextSpan(children: [
          TextSpan(text: "~ По стандарту публичный", style: Theme.of(context).textTheme.displayLarge),
          TextSpan(text: " *", style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color))
        ])),
        SizedBox(height: 5,),
        Text("Примеры", style: Theme.of(context).textTheme.titleMedium,),
      ],
    );
  }
}