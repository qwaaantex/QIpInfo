import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoSettingsListTile extends StatelessWidget {
  const QIpInfoSettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        ListTile(title: Text("Тема", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedColorPicker, color: Theme.of(context).iconTheme.color),),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Конфиденциальность", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedLocker, color: Theme.of(context).iconTheme.color,),),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Перезапуск служб", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedRefresh, color: Theme.of(context).iconTheme.color,),),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Очистить", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedDelete01, color: Theme.of(context).iconTheme.color,) ),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Оставить отзыв", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedBookUpload, color: Theme.of(context).iconTheme.color,),),
        Divider(color: Colors.grey,),
        ListTile(title: Text("Условия пользования", style: Theme.of(context).textTheme.bodyMedium,), leading: Icon(HugeIcons.strokeRoundedAccess, color: Theme.of(context).iconTheme.color,),)
      ],
    );
  }
}