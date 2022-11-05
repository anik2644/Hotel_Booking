
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: AuthService.ddemeChatMessages.length,
              itemBuilder: (context, index) => MessageForAdmin(AuthService.ddemeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),

      ],
    );
  }



}