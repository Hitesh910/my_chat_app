import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mychat_app/screen/chat/controller/chat_controller.dart';
import 'package:mychat_app/screen/chat/model/chat_model.dart';

import '../../../utils/helper/auth_helper.dart';
import '../../../utils/helper/db_helper.dart';
import '../../profile/model/profile_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController txtMsg = TextEditingController();
  ProfileModel? model = Get.arguments;
  ChatController controller = Get.put(ChatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text("${model!.name}"),
          leading: CircleAvatar(
            child: Text("${model!.name![0]}"),
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: controller.sp,
            builder: (context, snapshot) {
              if(snapshot.hasError)
                {
                  Text("${snapshot.hasError}");
                }
              else if(snapshot.hasData)
                {
                 QuerySnapshot allChatData = snapshot.data;
                 List<ChatModel> chatList = [];

                 for(var x in allChatData.docs)
                   {
                     Map m1 = x.data() as Map;
                     ChatModel model = ChatModel.mapToModel(m1);
                     model.uid = x.id;
                     chatList.add(model);
                   }

                 return  Expanded(
                     child: ListView.builder(
                     itemCount: chatList.length,
                     itemBuilder: (context, index) {
                       return InkWell(
                         onTap: () async{
                         await  FireDbHelper.helper.deleteData();
                         },
                         child: Container(
                           height: 50,
                           width: 10,
                           // color: Colors.red,
                           margin: const EdgeInsets.all(5),

                           alignment: chatList[index].senderUID == AuthHelper.helper.user!.uid
                               ? Alignment.centerRight
                               : Alignment.centerLeft,
                           child: Container(
                             height: 50,
                             width: MediaQuery
                                 .sizeOf(context)
                                 .width * 0.50,
                             // color: Colors.red,
                             decoration: const BoxDecoration(
                               color: Colors.red,
                               borderRadius: BorderRadius.all(
                                 Radius.circular(5),
                               ),
                             ),
                             alignment: Alignment.center,
                             child:  Text("${chatList[index].msg}"),
                             // margin: EdgeInsets.all(5),
                           ),
                         ),
                       );
                     },
                                      ),
                   );
                }
              return CircularProgressIndicator();
            }
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtMsg,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write a message",
                    ),
                  ),
                ),
                IconButton.filled(
                  onPressed: () {
                    ChatModel chatModel = ChatModel(
                      msg: txtMsg.text,
                      dateTime: DateTime.now(),
                      senderUID: AuthHelper.helper.user!.uid,
                    );

                    FireDbHelper.helper.sentMsg(
                      AuthHelper.helper.user!.uid,
                      model!.uid!,
                      chatModel,
                    );
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
