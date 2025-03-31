import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoSettings.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

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
      
      body: CustomScrollView(controller: _controller,
        slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor, surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: MediaQuery.of(context).size.height * 0.18,
      pinned: true,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      flexibleSpace: AnimatedSwitcher(duration: Duration(milliseconds: 100),
        child: !isClosed ? null :
      FlexibleSpaceBar(
        
        expandedTitleScale: 1.3,
        titlePadding: EdgeInsets.all(10),
        title: SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
          child: 
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,        
                      children: [
            Text('Добро пожаловать!', style: Theme.of(context).textTheme.titleLarge,),
            
            Row(
              children: [
                IconButton(onPressed: () {
                  context.read<QIpInfoBloc>().add(QIpInfoBlocRemoveAll());
                }, icon: Icon(HugeIcons.strokeRoundedRemoveCircleHalfDot, color: Theme.of(context).iconTheme.color)),
                IconButton(onPressed: () {
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                    return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset.zero)), child: QIpInfoSettings(),);
                  }));
                }, icon: Icon(HugeIcons.strokeRoundedSettings03, color: Theme.of(context).iconTheme.color,),),
              ],
            ),
                      ],
                    ),
          ))),
          title: AnimatedSwitcher(duration: Duration(milliseconds: 100),
        child: isClosed ? null :
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("QIpInfo", style: Theme.of(context).textTheme.titleLarge,),
            Row(
              children: [
                IconButton(onPressed: () {
                  context.read<QIpInfoBloc>().add(QIpInfoBlocRemoveAll());
                }, icon: Icon(HugeIcons.strokeRoundedRemoveCircleHalfDot, color: Theme.of(context).iconTheme.color)), 
                IconButton(onPressed: () {
                   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                    return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset.zero)), child: QIpInfoSettings(),);
                  }));
                }, icon: Icon(HugeIcons.strokeRoundedSettings03, color: Theme.of(context).iconTheme.color,),),
              ],
            ),
          ],),
          
    )),
            SliverAppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.8,
              flexibleSpace: FlexibleSpaceBar(background: QIpInfoMainColumn(),),),
        
         ]),
    );
  }
}