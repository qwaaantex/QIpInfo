import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoUsersLicenceIconButton extends StatelessWidget {
  const QIpInfoUsersLicenceIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).canvasColor), child: IconButton(onPressed: () {}, icon: Icon(HugeIcons.strokeRoundedAllBookmark, color: Theme.of(context).textTheme.titleLarge?.color,)),);

  }
}