import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/ListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QIpInfoSettingsColumn extends StatelessWidget {
  const QIpInfoSettingsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,       
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).canvasColor),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: QIpInfoSettingsListTile(),
                ),
              ),
            ],
          
        
      ),
    );
  }
}