import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/Column.dart';
import 'package:flutter/material.dart';

class QIpInfoFeedBackAlertDialog extends StatefulWidget {
  const QIpInfoFeedBackAlertDialog({super.key});

  @override
  State<QIpInfoFeedBackAlertDialog> createState() => _QIpInfoFeedBackAlertDialogState();
}

class _QIpInfoFeedBackAlertDialogState extends State<QIpInfoFeedBackAlertDialog> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller)..addListener(() {
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
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height * 0.9;
    return FadeTransition(opacity: _opacity, child:
    SizedBox(width: width, height: height,
      child: AlertDialog(backgroundColor: Theme.of(context).canvasColor,
        content: 
            QIpInfoFeedBackColumn(controller: _controller,),       
      ),
    ));
  }
}