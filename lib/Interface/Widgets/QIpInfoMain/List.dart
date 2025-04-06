import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/Models/QIpInfoModel/QIpInfoModel.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Error.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Tittle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoMainList extends StatefulWidget {
  final AnimationController controller;
  const QIpInfoMainList({super.key, required this.controller});

  @override
  State<QIpInfoMainList> createState() => _QIpInfoMainListState();
}

class _QIpInfoMainListState extends State<QIpInfoMainList> with TickerProviderStateMixin {
  late Animation<double> _sizeFactor;

  @override
  void initState() {
    super.initState();
    _sizeFactor = Tween<double>(begin: 1, end: 1.2).animate(widget.controller)..addListener(() {
      setState(() {        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<QProvider>().controller;
    final heigth = MediaQuery.of(context).size.height;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: BlocBuilder<QIpInfoBloc, QIpInfoModel>(
                      builder:(context, state) {return SizeTransition(sizeFactor:  _sizeFactor,
                      
                                          child: 
                                            Center(
                                              child: AnimatedSwitcher(duration: Duration(milliseconds: 700), child: state.success == null || controller.text == '' 
                                              ? Text(key: ValueKey<dynamic>(context.read<QIpInfoBloc>().state),
                                              "Пусто, говорят тут побывали драконы", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,)
                                              : state.success == false ? QIpInfoMainError()
                                           :                
                                          Column(mainAxisSize: MainAxisSize.min,
                        children: [QIpInfoMainTittle(),
                        SizedBox(height: heigth * 0.01,),
                        Divider(color: Colors.grey, indent: 20, endIndent: 20,),
                        SizedBox(height: heigth * 0.01,),
                                          Text("Континент: ${state.continent} | ${state.continentCode}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Регион: ${state.region} | ${state.regionCode}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Страна: ${state.country}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Интегрированный оператор: ${state.connection!.isp}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Часовая зона: ${state.timezone!.id} | ${state.timezone!.utc} | ${state.timezone!.offset}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Защита подключения: ${state.type}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Оператор: ${state.connection!.domain}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Столица: ${state.capital}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Индекс: ${state.postal}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Широта: ${state.latitude?.toStringAsFixed(3)} | Долгота: ${state.longitude?.toStringAsFixed(3)}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Отправляющий номер: +${state.callingCode}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("Граничит с: ${state.borders}", style: Theme.of(context).textTheme.labelSmall,),
                                          Text("АСН: ${state.connection!.asn}", style: Theme.of(context).textTheme.labelSmall,),
                                          ])),
                      ));         
                              }),
    );
  }
}