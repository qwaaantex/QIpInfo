import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/Models/QIpInfoModel/QIpInfoModel.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoMain/Tittle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class QIpInfoMainTextField extends StatelessWidget {
  const QIpInfoMainTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QProvider>(context).controller;
    final width = MediaQuery.of(context).size.width * 0.9;
    final heigth = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.black, fontSize: 15),
                cursorColor: Colors.black,
                minLines: 1,
                onSubmitted: (value) {
                  BlocProvider.of<QIpInfoBloc>(
                    context,
                  ).add(QIpInfoBlocUserInfo(value));
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"[a-zA-Z]")),
                ],
                decoration: InputDecoration(
                  hintText: "IP-адрес",
                  fillColor: Colors.red[300],
                  filled: true,
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                  prefixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: Icon(
                      HugeIcons.strokeRoundedClean,
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<QIpInfoBloc>(
                        context,
                      ).add(QIpInfoBlocUserInfo(controller.text));
                    },
                    icon: Icon(
                      HugeIcons.strokeRoundedSearch02,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Объем: ~ 15",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<QIpInfoBloc, QIpInfoModel>(
                key: ValueKey<dynamic>(context.read<QIpInfoBloc>().state),
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 700),
                    child:
                        state.success == null || controller.text == ''
                            ? Center(
                              child: Text(
                                "Пусто, говорят тут побывали драконы",
                                style: Theme.of(context).textTheme.labelMedium,
                                textAlign: TextAlign.center,
                              ),
                            )
                            : state.success == false
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Упc, похоже произошла неизвестная ошибка!",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<QIpInfoBloc>(
                                          context,
                                        ).add(
                                          QIpInfoBlocUserInfo(controller.text),
                                        );
                                      },
                                      icon: Icon(
                                        HugeIcons.strokeRoundedReload,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : Column(
                              children: [
                                QIpInfoMainTittle(),
                                SizedBox(height: heigth * 0.01),
                                Divider(
                                  color: Colors.grey,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                SizedBox(height: heigth * 0.01),

                                Text(
                                  "Континент: ${state.continent} | ${state.continentCode}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Регион: ${state.region} | ${state.regionCode}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Страна: ${state.country}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Интегрированный оператор: ${state.connection!.isp}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Часовая зона: ${state.timezone!.id} | ${state.timezone!.utc} | ${state.timezone!.offset}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Защита подключения: ${state.type}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Оператор: ${state.connection!.domain}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Столица: ${state.capital}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Индекс: ${state.postal}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Широта: ${state.latitude?.toStringAsFixed(3)} | Долгота: ${state.longitude?.toStringAsFixed(3)}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Отправляющий номер: +${state.callingCode}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Граничит с: ${state.borders}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "АСН: ${state.connection!.asn}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
