import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/Column.dart';
import 'package:flutter/material.dart';

class QIpInfoFeedBackAlertDialog extends StatefulWidget {
  const QIpInfoFeedBackAlertDialog({super.key});

  @override
  State<QIpInfoFeedBackAlertDialog> createState() => _QIpInfoFeedBackAlertDialogState();
}

class _QIpInfoFeedBackAlertDialogState extends State<QIpInfoFeedBackAlertDialog> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _position = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller)..addListener(() {
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
    return SlideTransition(position: _position, child:
    SizedBox(width: width, height: height,
      child: AlertDialog(backgroundColor: Theme.of(context).canvasColor,
        content: 
            QIpInfoFeedBackColumn(controller: _controller,),
          
        
      ),
    ));
  }
}