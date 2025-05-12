import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/constants/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../services/assets_manager.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
   late TextEditingController textEditingController;
  @override
  void initState(){
    textEditingController = TextEditingController ();
    super.initState();
  }

  @override
  void dispose (){
    textEditingController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded, color: Colors.white,))
        ],
        elevation: 2,
        leading: Padding(
            padding:EdgeInsets.all(8),
        child:CircleAvatar(
          radius: 20,
          child:  Image.asset(AssetsManager.openaiLogo),
        )

        ),
        title: Text("Flutter Chat AI",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder:(context , index ){
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("hello this is a text",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    ),
                  );
                } ),
          ),
        if (_isTyping)...[
          SpinKitPouringHourGlassRefined(
            color: Colors.brown[200]!,
            size: 45,
          ),
SizedBox(
  height: 15,
),
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(child: TextField(

                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: textEditingController,
                  onSubmitted: (value) {
                    //ToDO send message
                  },
                    decoration: InputDecoration (
                        hintText: "how can I help you ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon:     IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.white,)),
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),),
                ],
              ),
            ),
          ),


        ],

        ],
      ),),
    );
  }
}
