import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/Column.dart';
import 'package:flutter/material.dart';

class QIpInfoFeedBackAlertDialog extends StatefulWidget {
  const QIpInfoFeedBackAlertDialog({super.key});

  @override
  State<StatefulWidget> createState() => _QIpInfoAlertDialogState();
  
}
class _QIpInfoAlertDialogState extends State<QIpInfoFeedBackAlertDialog> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height * 0.9;
    return SizedBox(width: width, height: height,
      child: AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        content: QIpInfoFeedBackColumn(),
      ),
    );
  }
}