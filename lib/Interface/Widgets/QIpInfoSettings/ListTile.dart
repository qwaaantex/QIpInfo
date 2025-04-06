
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoThemerBloc/QIpInfoThemerBloc_bloc.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoConfidenty.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoUsersLicence.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/AlertDialog.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoSettings/Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:url_launcher/url_launcher.dart';

class QIpInfoSettingsListTile extends StatelessWidget {
  const QIpInfoSettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QProvider>(context).controller;
     final SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);
   
    
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<QIpInfoThemerBlocBloc, bool>(
                  builder: (context, state) { return ListTile(title: Text("Тема", style: Theme.of(context).textTheme.bodyMedium,), trailing: Switch(value: state, onChanged: (value) {            
                    context.read<QIpInfoThemerBlocBloc>().changeTheme();
                  }), leading: Icon(HugeIcons.strokeRoundedColorPicker, color: Theme.of(context).iconTheme.color,),);}),
                GestureDetector(onTap: () {
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                    return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoConfidenty(),);
                  }));
                },
                  child: ListTile(title: RichText(text: TextSpan(children: [
                    TextSpan(text: "Конфиденциальность", style: Theme.of(context).textTheme.bodyMedium,), TextSpan(text: "*", style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color))
                  ])), leading: Icon(HugeIcons.strokeRoundedLocker, color: Theme.of(context).iconTheme.color,),),),
                GestureDetector(onTap: () async {
                  _dialog.show(message: 'Перезапуск...', type: SimpleFontelicoProgressDialogType.multiHurricane, backgroundColor: Theme.of(context).canvasColor, radius: 12, indicatorColor: Theme.of(context).textTheme.titleLarge?.color);
        await Future.delayed(Duration(seconds: 4));
        _dialog.hide();
                  controller.clear();
                  BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocRemoveAll());
                  Navigator.pop(context);
                },
                  child: ListTile(title: Text("Перезапуск служб", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedRefresh, color: Theme.of(context).iconTheme.color,),)),
               GestureDetector(onTap: () async{
                _dialog.show(message: "Очищаем...", type: SimpleFontelicoProgressDialogType.multiHurricane, backgroundColor: Theme.of(context).canvasColor, indicatorColor: Theme.of(context).textTheme.titleLarge?.color, radius: 12);
                await Future.delayed(Duration(seconds: 2));
                _dialog.hide();
                          context.read<QIpInfoBloc>().add(QIpInfoBlocRemoveAll());
                          Navigator.pop(context);
                          },
                          child: ListTile(title: Text("Очистить", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedDelete01, color: Theme.of(context).iconTheme.color,) )),
                GestureDetector(onTap: () {
                  showDialog(context: context, builder: (context) => 
                    QIpInfoFeedBackAlertDialog());
                },
                  child: ListTile(title: RichText(text: TextSpan(children: [
                    TextSpan(text: "Оставить отзыв", style: Theme.of(context).textTheme.bodyMedium,),
                    TextSpan(text: "*", style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color))
                  ])), leading: Icon(HugeIcons.strokeRoundedBookUpload, color: Theme.of(context).iconTheme.color,),)),
                GestureDetector(onTap: () {
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                    return SlideTransition(position: animation1.drive(Tween(begin: Offset(2.0, 0), end: Offset(0, 0))), child: QIpInfoUsersLicense(),);
                  }));
                },
                  child: ListTile(title: RichText(text: TextSpan(children: [
                    TextSpan(text: "Условия пользования", style: Theme.of(context).textTheme.bodyMedium,),
                    TextSpan(text: "*", style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color))
                  ])), leading: Icon(HugeIcons.strokeRoundedAccess, color: Theme.of(context).iconTheme.color,),)),
                GestureDetector(onTap: () async {
                  if (!await launchUrl(context.read<QProvider>().linkToVisit)) {
                    QIpInfoSettingsContainer(text1: "Упс.. Похоже", text2: "произошла неизвестная ошибка",);
                  }
                },
                  child: ListTile(leading: Icon(HugeIcons.strokeRoundedContact01, color: Theme.of(context).iconTheme.color,), title: Text("Связаться с нами", style: Theme.of(context).textTheme.bodyMedium,)),),
                  GestureDetector(onTap: () async {
                    if (!await launchUrl(context.read<QProvider>().ErrorLink)) {
                    QIpInfoSettingsContainer(text1: "Упс.. Похоже", text2: "произошла неизвестная ошибка",);
                  }
                  },
                    child: ListTile(leading: Icon(HugeIcons.strokeRoundedQuestion,color: Theme.of(context).iconTheme.color,), title: Text("Сообщить об ошибке", style: Theme.of(context).textTheme.bodyMedium,),),)
              ],
            
          ),
    );
      }
    
  }
