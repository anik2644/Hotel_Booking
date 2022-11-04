
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';

import '../../../components/filled_outline_button.dart';
import '../../../constants.dart';
import '../../../models/Chat.dart';
import '../../messages/messageScreenForAllChatMembers.dart';
import '../../messages/message_screen.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            messagesScreenForAllChatMembers(),
                      ),

                    );
                    AuthService.indx=index;
                    print(index);
                    //print("object");

              }
            ),
          ),
        ),
      ],
    );
  }
}
