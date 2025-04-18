import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoFeedBackCubit/QIpInfoFeedBack_cubit.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoThemerBloc/QIpInfoThemerBloc_bloc.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Theme/Theme.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';



class QIpInfoMain extends StatelessWidget {
  final bool? theme;
  final int? index;
  const QIpInfoMain({super.key, this.theme, this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => QProvider(),
        child: MultiBlocProvider(providers: [
      BlocProvider(create: (context) => QIpInfoBloc()),
      BlocProvider(create: (context) => QIpInfoThemerBlocBloc(theme)),
      BlocProvider(create: (context) => QIpInfoConfidentyBloc(index)),
      BlocProvider(create: (context) => QIpInfoFeedBackCubit())

      ],
    
      child: Builder(
        builder: (context) {
          return MaterialApp(
          theme: Provider.of<QIpInfoThemerBlocBloc>(context).state == true ? themeDark() : themeLight(),
          themeMode: ThemeMode.system,
          home: ScaffoldMainIpInfo());
        }
      )
    ));
  }
}