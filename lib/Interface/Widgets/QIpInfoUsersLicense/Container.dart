import 'package:QIpInfo/Interface/Widgets/QIpInfoUsersLicense/Text.dart';
import 'package:flutter/material.dart';

class QIpInfoUsersLicenseContainer extends StatelessWidget {
  const QIpInfoUsersLicenseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    return Container(
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Theme.of(context).canvasColor),
        child: QIpInfoUsersLicenseText(),
        
      
    );
  }
}