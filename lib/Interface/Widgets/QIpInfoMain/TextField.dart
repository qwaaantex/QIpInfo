import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/Models/QIpInfoModel/QIpInfoModel.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoMainTextField extends StatelessWidget {
  const QIpInfoMainTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: context.read<QProvider>().userIp);
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                style: Theme.of(context).textTheme.headlineSmall,
                cursorColor: Theme.of(context).textTheme.headlineSmall?.color,
                onSubmitted: (value) {
                  BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocUserInfo(value));
                
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"[a-zA-Z]"))],
                decoration: InputDecoration(
                hintText: "IP-адрес",
                  fillColor: Colors.red[300],
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                  prefixIcon: IconButton(onPressed: () {
                    controller.clear();
                  },
                    icon: Icon(HugeIcons.strokeRoundedClean, color: Theme.of(context).textTheme.headlineSmall?.color,)),
                  suffixIcon: IconButton(onPressed: () {
                    BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocUserInfo(controller.text));
                  }, icon: Icon(HugeIcons.strokeRoundedSearch01, color: Theme.of(context).textTheme.headlineSmall?.color,)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red))
                ),
              ),
              SizedBox(height: 5,),
              Padding(padding: EdgeInsets.only(right: 10),
                child: Align(alignment: Alignment.centerRight, child: Text("Объем: ~ 15", textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodySmall,),)),
              SizedBox(height: 20,),
              BlocBuilder<QIpInfoBloc, QIpInfoModel>(
                  key: ValueKey<dynamic>(context.read<QIpInfoBloc>().state),
                    builder:(context, state) {return AnimatedSwitcher(duration: Duration(milliseconds: 700),
                child: state.success == null || controller.text == '' ? Center(
                  child: Text("Пусто, говорят тут побывали драконы", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,)) : state.success == false ?
                Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Упc, похоже произошла неизвестная ошибка!", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocUserInfo(controller.text));
                  }, child: Icon(HugeIcons.strokeRoundedReload, color: Theme.of(context).iconTheme.color,))
                
                ],),) :
                Column(
                    children: [Text("Континент: ${state.continent} | ${state.continentCode}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Регион: ${state.region} | ${state.regionCode}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Страна: ${state.country}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Интегрированный оператор: ${state.connection!.isp}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Часовая зона: ${state.timezone!.id} | ${state.timezone!.utc} | ${state.timezone!.offset}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Защита подключения: ${state.type}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Оператор: ${state.connection!.domain}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Столица: ${state.capital}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Индекс: ${state.postal}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Широта: ${state.latitude} | Долгота: ${state.longitude}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Отправляющий номер: +${state.callingCode}", style: Theme.of(context).textTheme.labelSmall,),
                Text("Граничит с: ${state.borders}", style: Theme.of(context).textTheme.labelSmall,),
                Text("АСН: ${state.connection!.asn}", style: Theme.of(context).textTheme.labelSmall,),
                SizedBox(height: 20,),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(48)),
                      
                  child: Image(
                    image: 
                Svg(state.flag!.img.toString(), source: SvgSource.network), errorBuilder: (context, error, stackTrace) {
                  return SizedBox(width: MediaQuery.of(context).size.width * 0.5, child: ElevatedButton(onPressed: () {
                    context.read<QIpInfoBloc>().add(QIpInfoBlocUserInfo(controller.text));
                  }, child: Icon(HugeIcons.strokeRoundedReload, color: Theme.of(context).iconTheme.color,)),);
                },)  )]));         
                            },           
                          
              ),
        
        ]),
      )));
  }
}