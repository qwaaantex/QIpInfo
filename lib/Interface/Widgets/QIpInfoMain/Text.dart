import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoMainText extends StatelessWidget {
  const QIpInfoMainText({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QProvider>();
    return Column(
      children: [
        Text("Ваш IP-адрес:", style: Theme.of(context).textTheme.bodyLarge,),
        provider.userIp != null ? 
          Text(provider.userIp.toString(), style: Theme.of(context).textTheme.titleMedium,) : Column(children: [SizedBox(height: 10,),CircularProgressIndicator(color: Colors.red,), SizedBox(height: 10,)])
      ],
    );
  }
}