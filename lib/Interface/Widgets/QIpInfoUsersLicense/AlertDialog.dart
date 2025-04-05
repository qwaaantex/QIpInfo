
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class QIpInfoUsersLicenseAlertDialog extends StatefulWidget {
  const QIpInfoUsersLicenseAlertDialog({super.key});

  @override
  State<QIpInfoUsersLicenseAlertDialog> createState() => _QIpInfoUsersLicenseAlertDialogState();
}

class _QIpInfoUsersLicenseAlertDialogState extends State<QIpInfoUsersLicenseAlertDialog> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;

  void error({required BuildContext context}) {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(leading: Icon(HugeIcons.strokeRoundedNotification01, color: Theme.of(context).textTheme.titleLarge?.color,),
    content: Text("Ошибка запуска"), actions: <Widget>[Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).textTheme.titleLarge?.color),
    child: TextButton(onPressed: () {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    }, child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("Отмена"),
    )),)]));
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 300),vsync: this);
    _position = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller)..addListener(() {
      setState(() {
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = MediaQuery.of(context).size.height * 0.1;
    
    return SlideTransition(position: _position, child:
    Container(width: width, height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(alignment: Alignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Вас что-то не устроило?", style: Theme.of(context).textTheme.bodyMedium,),
              Text("Поделитесь с нами", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontSize: 14, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, decorationThickness: 1, decorationColor: Colors.white, decorationStyle: TextDecorationStyle.solid),)
            ],),
            Align(alignment: Alignment.topLeft,
              child: IconButton(onPressed: () async {
                await _controller.reverse();
                if (mounted) {Navigator.pop(context);}
              }, icon: Icon(Icons.close, color: Theme.of(context).textTheme.titleLarge?.color,))),
              Align(alignment: Alignment.bottomRight, child: IconButton(icon: Icon(HugeIcons.strokeRoundedShare01, color: Theme.of(context).textTheme.titleLarge?.color,),
                onPressed: () async {
                  if (mounted) {
                      Navigator.pop(context);
                      try {
                      if (!await launchUrl(context.read<QProvider>().linkToVisit)) {
                        error(context: context);
                      }
                    } catch (e) {
                      error(context: context);
                    }
                  }
      }))],
        )
      )),));
  }
}