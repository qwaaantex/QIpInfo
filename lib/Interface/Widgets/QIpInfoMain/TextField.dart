import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class QIpInfoMainTextField extends StatelessWidget {
  final AnimationController controllerAnim;
  const QIpInfoMainTextField({super.key, required this.controllerAnim});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QProvider>(context).controller;
    final AnimationController controllerAnimated = controllerAnim;
    final width = MediaQuery.of(context).size.width * 0.9;
    return Center(
      child: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.black, fontSize: 15),
                cursorColor: Colors.black,
                minLines: 1,
                onSubmitted: (value) {
                  BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocUserInfo(value));
                
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"[a-zA-Z]"))],
                decoration: InputDecoration(
                hintText: "IP-адрес",
                  fillColor: Colors.red[300],
                  filled: true,
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                  prefixIcon: IconButton(onPressed: () {
                    controller.clear();
                  },
                    icon: Icon(HugeIcons.strokeRoundedClean, color: Colors.black)),
                  suffixIcon: IconButton(onPressed: () {
                    controllerAnimated.reverse();
                    BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocUserInfo(controller.text));
                 }, icon: Icon(HugeIcons.strokeRoundedSearch02, color: Colors.black)),            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red))
                ),
              ),
              SizedBox(height: 5,),
              Padding(padding: EdgeInsets.only(right: 10),
                child: Align(alignment: Alignment.centerRight, child: Text("Объем: ~ 15", textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodySmall,),))
              
        ]),
      )));
  }
}