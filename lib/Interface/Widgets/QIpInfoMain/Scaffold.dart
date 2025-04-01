import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/AppBar.dart';
import 'package:flutter/material.dart';


class ScaffoldMainIpInfo extends StatefulWidget {
  const ScaffoldMainIpInfo({super.key});

  @override
  State<ScaffoldMainIpInfo> createState() => _ScaffoldMainIpInfoState();
}

class _ScaffoldMainIpInfoState extends State<ScaffoldMainIpInfo> {
  final _controller = ScrollController();
  bool isClosed = true;
  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.offset <=10) {
          setState(() {
              isClosed = true;
          });
        } else {
          setState(() {
            isClosed = false;
          });
        }
      }
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.onDetach;
    isClosed = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      
      body: QIpInfoMainAppBar()
    );
  }
}