import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoSettings.dart';
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).canvasColor),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                  return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoSettings(),);
              }));
              }, icon: Icon(HugeIcons.strokeRoundedNext, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,)),
              SizedBox(width: 10,),
              IconButton(
                    onPressed: () async {
                          final result = await Share.share("Привет, я использую QIpInfo для получения информации о пользователе. Скачай его и ты, по ссылке ${context.read<QProvider>().linkDownload}");
                          if (result == ShareResultStatus.success)
                      {
                        return;
                      } else {
                        
                        ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(leading: Icon(HugeIcons.strokeRoundedNotification01, color: Theme.of(context).textTheme.titleLarge?.color,),
                            dividerColor: Colors.transparent,
                          backgroundColor: Theme.of(context).canvasColor,
                          content: Text("Вы прервали отправку приглашения", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color), textAlign: TextAlign.center,), actions: <Widget> [TextButton(style: TextButton.styleFrom(overlayColor: Colors.transparent),
                            onPressed: () {
                          ScaffoldMessenger.of(context).clearMaterialBanners();
                        }, child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).textTheme.titleLarge?.color),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Закрыть", style: Theme.of(context).textTheme.displaySmall,),
                          )))])); }             
                      },
                     icon: Icon(HugeIcons.strokeRoundedShareLocation01), color: Theme.of(context).textTheme.titleLarge?.color, iconSize: 50,)
          ],
        ),
      ),
    );
  }
}