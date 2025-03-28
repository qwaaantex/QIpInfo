import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoMainTextField extends StatelessWidget {
  const QIpInfoMainTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              style: Theme.of(context).textTheme.bodySmall,
              onSubmitted: (value) {
                context.read<QIpInfoBloc>().add(QIpInfoBlocUserInfo(controller));
              },
              decoration: InputDecoration(
                hintText: "IP-адрес",
                hintStyle: Theme.of(context).textTheme.labelSmall,
                prefixIcon: Icon(HugeIcons.strokeRoundedSearch01, color: Theme.of(context).iconTheme.color,),
                suffixIcon: IconButton(onPressed: () {}, icon: Icon(HugeIcons.strokeRoundedUserAdd02)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red))
              ),
            ),
            BlocBuilder<QIpInfoBloc, dynamic>(builder:(context, state) {return Text(state.toString(), style: Theme.of(context).textTheme.labelSmall,);})
          ],
        ),
      ),
    );
  }
}