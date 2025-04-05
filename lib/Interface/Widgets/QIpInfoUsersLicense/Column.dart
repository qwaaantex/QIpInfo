import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/Container.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/IconButton.dart';
import 'package:flutter/material.dart';

class QIpInfoUsersLicenseColumn extends StatefulWidget {
  const QIpInfoUsersLicenseColumn({super.key});

  @override
  State<QIpInfoUsersLicenseColumn> createState() => _QIpInfoUsersLicenseColumnState();
}

class _QIpInfoUsersLicenseColumnState extends State<QIpInfoUsersLicenseColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
      children: [
      QIpInfoUsersLicenseContainer(),
      SizedBox(height: 20,),
      QIpInfoUsersLicenceIconButton(),
      SizedBox(height: 20,),

      ],);
  }
}