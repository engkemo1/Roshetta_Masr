import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/widget/text.dart';

import '../../../model/doctor_information_model.dart';
import 'widget/chat_item.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("الرسائل", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: getBody(),
    );
  }

  getBody(){
    return
      SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextBox(),
                    const SizedBox(height: 20,),
                    getChatList()
                  ]
              )
          )
      );
  }

  getChatList(){
    return
      Column(
          children: List.generate(
              chatsData.length,
                  (index) => ChatItem(chatsData[index])
          )
      );
  }
}