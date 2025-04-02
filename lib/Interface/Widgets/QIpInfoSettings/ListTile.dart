import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_bloc.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoThemerBloc/QIpInfoThemerBloc_bloc.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoConfidenty.dart';
import 'package:QIpInfo/Interface/Screens/QIpInfoUsersLicence.dart';
import 'package:QIpInfo/Interface/Widgets/QIpInfoFeedBack/AlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoSettingsListTile extends StatelessWidget {
  const QIpInfoSettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        BlocBuilder<QIpInfoThemerBlocBloc, bool>(
          builder: (context, state) { return ListTile(title: Text("Тема", style: Theme.of(context).textTheme.bodyMedium,), trailing: Switch(value: state, onChanged: (value) {
          
            context.read<QIpInfoThemerBlocBloc>().add(QIpInfoThemerBlocEvent());
          }), leading: Icon(HugeIcons.strokeRoundedColorPicker, color: Theme.of(context).iconTheme.color,),);}),
        Divider(color: Colors.grey,),
        GestureDetector(onTap: () {
          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
            return SlideTransition(position: animation1.drive(Tween(begin: Offset(2, 0), end: Offset(0, 0))), child: QIpInfoConfidenty(),);
          }));
        },
          child: ListTile(title: Text("Конфиденциальность", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedLocker, color: Theme.of(context).iconTheme.color,),)),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Перезапуск служб", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedRefresh, color: Theme.of(context).iconTheme.color,),),
        Divider(color: Colors.grey,),
        GestureDetector(onTap: () {
          BlocProvider.of<QIpInfoBloc>(context).add(QIpInfoBlocRemoveAll());
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