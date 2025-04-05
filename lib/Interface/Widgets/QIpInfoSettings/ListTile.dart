
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoThemerBloc/QIpInfoThemerBloc_bloc.dart';
import 'package:QIpInfo/Data/Provider/QProvider.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoConfidenty.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoUsersLicence.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/AlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class QIpInfoSettingsListTile extends StatelessWidget {
  const QIpInfoSettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QProvider>(context).controller;
     final SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);
   
    
    return Column(mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<QIpInfoThemerBlocBloc, bool>(
                builder: (context, state) { return ListTile(title: Text("Тема", style: Theme.of(context).textTheme.bodyMedium,), trailing: Switch(value: state, onChanged: (value) {
                
                  context.read<QIpInfoThemerBlocBloc>().changeTheme();
                }), leading: Icon(HugeIcons.strokeRoundedColorPicker, color: Theme.of(context).iconTheme.color,),);}),
              Divider(color: Colors.grey,),
              GestureDetector(onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                  return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoConfidenty(),);
                }));
              },
                child: ListTile(title: Text("Конфиденциальность", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedLocker, color: Theme.of(context).iconTheme.color,),)),
              Divider(color: Colors.grey,),
              GestureDetector(onTap: () async {
                _dialog.show(message: 'Перезапуск...', type: SimpleFontelicoProgressDialogType.multiHurricane, backgroundColor: Theme.of(context).canvasColor, radius: 12, indicatorColor: Theme.of(context).textTheme.titleLarge?.color);
      await Future.delayed(Duration(seconds: 4));
      _dialog.hide();
                controller.clear();
                BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocRemoveAll());
                Navigator.pop(context);
              },
                child: ListTile(title: Text("Перезапуск служб", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedRefresh, color: Theme.of(context).iconTheme.color,),)),
              Divider(color: Colors.grey,),
             GestureDetector(onTap: () async{
              _dialog.show(message: "Очищаем...", type: SimpleFontelicoProgressDialogType.multiHurricane, backgroundColor: Theme.of(context).canvasColor, indicatorColor: Theme.of(context).textTheme.titleLarge?.color);
              await Future.delayed(Duration(seconds: 2));
              _dialog.hide();
                        context.read<QIpInfoBloc>().add(QIpInfoBlocRemoveAll());
                        Navigator.pop(context);
                        },
                        child: ListTile(title: Text("Очистить", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedDelete01, color: Theme.of(context).iconTheme.color,) )),
              

              Divider(color: Colors.grey,),
              GestureDetector(onTap: () {
                showDialog(context: context, builder: (context) => 
                  QIpInfoFeedBackAlertDialog());
              },
                child: ListTile(title: Text("Оставить отзыв", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedBookUpload, color: Theme.of(context).iconTheme.color,),)),
              Divider(color: Colors.grey,),
              GestureDetector(onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                  return SlideTransition(position: animation1.drive(Tween(begin: Offset(2.0, 0), end: Offset(0, 0))), child: QIpInfoUsersLicense(),);
                }));
              },
                child: ListTile(title: Text("Условия пользования", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedAccess, color: Theme.of(context).iconTheme.color,),))
            ],
          
        );
      }
    
  }
