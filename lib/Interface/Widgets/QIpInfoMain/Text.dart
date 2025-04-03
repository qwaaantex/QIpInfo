import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_state.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoMainText extends StatelessWidget {
  const QIpInfoMainText({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QProvider>();
    return BlocBuilder<QIpInfoConfidentyBloc, QIpInfoConfidentyMetrics>(
      builder: (context, state) {
        return Column(
          children: [
            Text("Ваш IP-адрес:", style: Theme.of(context).textTheme.bodyLarge),
            state.index == 1
                ? Text("Скрыто", style: Theme.of(context).textTheme.titleMedium)
                : provider.userIp != null
                ? Text(
                  provider.userIp.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                )
                : Column(
                  children: [
                    SizedBox(height: 10),
                    CircularProgressIndicator(color: Colors.red.shade300),
                    SizedBox(height: 10),
                  ],
                ),
          ],
        );
      },
    );
  }
}
