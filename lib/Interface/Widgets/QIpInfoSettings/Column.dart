import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/ListTile.dart';
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
              QIpInfoSettingsListTile()
            ],
          
        
      ),
    );
  }
}