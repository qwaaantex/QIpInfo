import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Theme/Theme.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';



class QIpInfoMain extends StatelessWidget {
  const QIpInfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => QIpInfoBloc())
    ],
      child: MaterialApp(
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: ThemeMode.light,
      home: ChangeNotifierProvider(create: (context) => QProvider(),
        child: ScaffoldMainIpInfo())
    ));
  }
}