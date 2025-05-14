import'package:flutter/material.dart';
import 'package:flutter_chat_bot/widgets/text_widget.dart';

Color ScaffoldBackgroundColor = const Color(0XFF343541);
Color cardColor = const Color(0XFF444654);

List <String> models=[
  "Model1",
  "Model2",
  "Model3",
  "Model4",
  "Model5",
  "Model6",
];
 List <DropdownMenuItem<String>>? get getModelsItem{
List <DropdownMenuItem<String>>? modelsItems =
List <DropdownMenuItem<String>>.generate(
    models.length,
(index)=> DropdownMenuItem(
value: models[index],
child: TextWidget(label: models[index],
  fontSize: 15,
)));
return modelsItems ;
}
final chatMessages = [
  {
    "msg": "Hello who are you ",
     "chatIndex" : 0 ,
  },
  {
    "msg": "Hello! I’m ChatGPT, an AI developed by OpenAI. I can assist you with a wide range of topics like coding (including Flutter), writing, research, interview prep, and more. How may I help you today? ",
    "chatIndex" : 1 ,
  },
  {
    "msg": "what is Flutter ?",
    "chatIndex" : 0 ,
  },
  {
    "msg": "flutter is an open-source mobile  application development framework created by Google . it is used to develop appilcation for Android,IOS ,Linus ,Mac,Windows , and the  web .Flutter uses the Dart programming language and allows for the allows for the creation of high- performance visually attraction and  responsive apps . it also has a growing and supportive community , and  offers many customizable widget for builing beautiful and responsive user interfaces.",
    "chatIndex" : 1 ,
  },
  {
    "msg": "Okay thanks",
    "chatIndex" : 0 ,
  },
  {
    "msg": "You're welcome ! Let me know if you have any other  question or if there's anything else i can help you with ",
    "chatIndex" : 1 ,
  },
  {
    "msg": " Is Flutter dying ? ",
    "chatIndex" : 0 ,
  },
  {
    "msg": "Flutter is not dying, but evolving. It remains a solid choice for cross-platform mobile development in 2025, especially for freelance developers, startups, and those wanting to build for both Android and iOS quickly",
    "chatIndex" : 1 ,
  },
];