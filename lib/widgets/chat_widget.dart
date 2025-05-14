import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/constants/constants.dart';
import 'package:flutter_chat_bot/services/assets_manager.dart';
import 'package:flutter_chat_bot/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
final String msg ;
final int chatIndex ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? ScaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  width: 30,
                  height: 30,
                ),
        SizedBox(width: 5,),
         Expanded(
           child: TextWidget(label: msg , fontSize: 20,

                   ),
         )
              ],
            ),
          ),
        )
      ],
    );
  }
}
