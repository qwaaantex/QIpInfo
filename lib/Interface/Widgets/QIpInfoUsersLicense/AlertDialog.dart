import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class QIpInfoUsersLicenseAlertDialog extends StatelessWidget {
  const QIpInfoUsersLicenseAlertDialog({super.key});

  void error({required BuildContext context}) {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(leading: Icon(HugeIcons.strokeRoundedNotification01, color: Theme.of(context).textTheme.titleLarge?.color,),
                    content: Text("Ошибка запуска"), actions: <Widget>[Container(child: TextButton(onPressed: () {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    }, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Отмена"),
                    )),)]));
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = MediaQuery.of(context).size.height * 0.1;
    return Container(width: width, height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(alignment: Alignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Вас что-то не устроило?"),
              Text("Поделитесь с нами")
            ],),
            Align(alignment: Alignment.topLeft,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.close, color: Theme.of(context).textTheme.titleLarge?.color,))),
              Align(alignment: Alignment.bottomRight, child: IconButton(icon: Icon(HugeIcons.strokeRoundedShare01, color: Theme.of(context).textTheme.titleLarge?.color,),
                onPressed: () async {
                Navigator.pop(context);
                try {
                if (!await launchUrl(context.read<QProvider>().linkToVisit)) {
                  error(context: context);
                }
              } catch (e) {
                error(context: context);
              }
  }))],
        )
      )),);
  }
}