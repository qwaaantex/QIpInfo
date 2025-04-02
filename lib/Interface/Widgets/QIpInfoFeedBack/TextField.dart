import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QIpInfoFeedBackTextField extends StatelessWidget {
  const QIpInfoFeedBackTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
        maxLength: 300,
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        decoration: InputDecoration(
          hintText: "Ваш отзыв",          
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Theme.of(context).dividerColor)),
          prefixIcon: Icon(HugeIcons.strokeRoundedComment01),
          suffixIcon: IconButton(onPressed: () {
            
          }, icon: Icon(HugeIcons.strokeRoundedCommentAdd01)),
         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(width: 2, color: Colors.red.shade300))
        ),
        controller: controller,
      
    );
  }
}