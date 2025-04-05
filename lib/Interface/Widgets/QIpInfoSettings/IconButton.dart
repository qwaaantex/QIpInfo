import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

class QIpInfoSettingsIconButton extends StatelessWidget {
  const QIpInfoSettingsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
          children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(HugeIcons.strokeRoundedArrowLeft04, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,)),
          SizedBox(width: 10,),
          IconButton(onPressed: () async {
            final result = await Share.share("Привет, я использую QIpInfo для получения информации о пользователе. Скачай его и ты, по ссылке ${context.read<QProvider>().linkDownload}");
                          if (result.status == ShareResultStatus.success)
                      {
                        return;
                      } else { 
                        showDialog(context: context, builder: (context) {
                          return QIpInfoSettingsContainer(text1: "Вы прервали отправку", text2: "приглашения",);
                        });                   
                         } 
          }, icon: Icon(HugeIcons.strokeRoundedShareLocation01, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,))
        ],),
      ),
    );
  }
}