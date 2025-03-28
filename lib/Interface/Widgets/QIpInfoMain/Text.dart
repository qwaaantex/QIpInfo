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
        Text("Ваш IP-адрес:", style: Theme.of(context).textTheme.bodyMedium,),
        provider.userIp != null ? Text(provider.userIp.toString(), style: Theme.of(context).textTheme.labelMedium,) : CircularProgressIndicator(color: Colors.red,)
      ],
    );
  }
}