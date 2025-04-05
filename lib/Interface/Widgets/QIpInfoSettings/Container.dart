import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoSettingsContainer extends StatefulWidget {
  final String text1;
  final String text2;
  const QIpInfoSettingsContainer({super.key, required this.text1, required this.text2});

  @override
  State<QIpInfoSettingsContainer> createState() => _QIpInfoSettingsContainerState();
}

class _QIpInfoSettingsContainerState extends State<QIpInfoSettingsContainer> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _position = Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller)..addListener(() {
      setState(() {
        
      });
    });
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min,
      children: [
        SlideTransition(position: _position,
          child: Container(width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).canvasColor), child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Align(alignment: Alignment.centerLeft,
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(HugeIcons.strokeRoundedNotification01, color: Theme.of(context).textTheme.titleLarge?.color, size: 28,),
              )),
                  SizedBox(width: 10,),         
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.text1, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color), textAlign: TextAlign.center,),
                          Text(widget.text2, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Align(alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: () async {
                      await _controller.reverse();
                              if (mounted) {Navigator.pop(context);}
                    }, child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Theme.of(context).textTheme.titleLarge?.color), child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Отмена", style: TextStyle(color: Colors.black),),
                    ),)),
                  )
                        ],),
            ),),
        ),
      
    ],
    );
  }
}