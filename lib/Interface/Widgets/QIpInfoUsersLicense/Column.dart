import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/IconButton.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/Text.dart';
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
      QIpInfoUsersLicenseText(),
      SizedBox(height: 10,),
      QIpInfoUsersLicenceIconButton()
      ],);
  }
}