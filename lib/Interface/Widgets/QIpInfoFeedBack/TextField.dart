import 'package:QIpInfo/Data/BLoc/QIpInfoFeedBackCubit/QIpInfoFeedBack_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoFeedBackTextField extends StatefulWidget {
  final AnimationController controller;

  const QIpInfoFeedBackTextField({super.key, required this.controller});


  @override
  State<QIpInfoFeedBackTextField> createState() => _QIpInfoFeedBackTextFieldState();
}

class _QIpInfoFeedBackTextFieldState extends State<QIpInfoFeedBackTextField> with TickerProviderStateMixin {
  late TextEditingController controllerText;
  @override
  void initState() {
    super.initState();
    controllerText = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return TextField(
            maxLength: 300,
            cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
            decoration: InputDecoration(
              hintText: "Ваш отзыв",          
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Theme.of(context).dividerColor)),
              prefixIcon: Icon(HugeIcons.strokeRoundedComment01),
              suffixIcon: IconButton(onPressed: () async {
                  await widget.controller.reverse();
                     if (mounted) {context.read<QIpInfoFeedBackCubit>().sendReview(controllerText.text);
                Navigator.pop(context);
                controllerText.clear();}
                  
                
              }, icon: Icon(HugeIcons.strokeRoundedCommentAdd01)),
             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red.shade300))
            ),
            controller: controllerText,
          
        );
      }
    );
  }
}