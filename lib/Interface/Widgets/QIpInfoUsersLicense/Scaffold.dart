import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/Column.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoUsersLicenseScaffold extends StatelessWidget {
  const QIpInfoUsersLicenseScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(scrolledUnderElevation: 0, centerTitle: true,
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(HugeIcons.strokeRoundedArrowLeft01, color: Theme.of(context).iconTheme.color,)),
        title: Text("Условия пользования", style: Theme.of(context).textTheme.titleMedium,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,),
      body: Align(alignment: Alignment.topCenter,
        child: SingleChildScrollView(child: QIpInfoUsersLicenseColumn(),)),
    );
  }
}