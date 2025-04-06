import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoSettings.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/Container.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class QIpInfoMainIconButton extends StatefulWidget {
  const QIpInfoMainIconButton({super.key});

  @override
  State<QIpInfoMainIconButton> createState() => _QIpInfoMainIconButtonState();
}

class _QIpInfoMainIconButtonState extends State<QIpInfoMainIconButton> with SingleTickerProviderStateMixin {

 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              style: Theme.of(context).iconButtonTheme.style,
                    onPressed: () async {
                          final result = await Share.share("Привет, я использую QIpInfo для получения информации о пользователе. Скачай его и ты, по ссылке: ${context.read<QProvider>().linkDownload}");
                          if (result.status == ShareResultStatus.success)
                      {
                        return;
                      } else {
                        showDialog(context: context,
                          builder: (context) {return QIpInfoSettingsContainer(text1: "Вы прервали отправку", text2: "приглашения",);});
                      }},
                     icon: Icon(HugeIcons.strokeRoundedShareLocation01), color: Theme.of(context).textTheme.titleLarge?.color, iconSize: 50,),
            SizedBox(width: 10,),
            IconButton(onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                  return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoSettings(),);
              }));
              }, icon: Icon(HugeIcons.strokeRoundedArrowRight04, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,)),
          ]
        ),
      ),
    );
  }
}