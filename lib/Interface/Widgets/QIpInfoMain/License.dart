import 'package:flutter/material.dart';

class QIpInfoMainLicense extends StatelessWidget {
  const QIpInfoMainLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text("Приложение не несет ответственности за ваши действия," 
        " оно лишь помогает вам узнать подробности об IP-адресе", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
      ),
    );
  }
}