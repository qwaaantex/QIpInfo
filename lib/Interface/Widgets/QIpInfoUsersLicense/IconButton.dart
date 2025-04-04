import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/AlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoUsersLicenceIconButton extends StatelessWidget {
  const QIpInfoUsersLicenceIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).canvasColor), child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(HugeIcons.strokeRoundedCheckmarkCircle04, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,)),
              IconButton(onPressed: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (context) => Align(alignment: Alignment.topCenter,
                  child: QIpInfoUsersLicenseAlertDialog()));
              }
              , icon: Icon(HugeIcons.strokeRoundedClosedCaption, color: Theme.of(context).textTheme.titleLarge?.color, size: 50,)),
            ],
          );
        }
      ),
    ),);

  }
}