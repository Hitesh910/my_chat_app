class ChatModel
{
  String? msg,senderUID,uid;
  DateTime? dateTime;

  ChatModel({this.msg, this.senderUID, this.dateTime,this.uid});

  factory ChatModel.mapToModel(Map m1)
  {
    return ChatModel(
      msg: m1['msg'],
      senderUID: m1['senderUID'],
      dateTime: m1['dateTime'],
    );
  }
}