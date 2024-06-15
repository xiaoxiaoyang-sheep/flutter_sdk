import 'dart:async';

import 'package:chat_message/models/message_model.dart';
import 'package:flutter/widgets.dart';

class ChatController extends IChatController {
  // 初始化数据
  final List<MessageModel> initialMessageList;
  final ScrollController scrollController;

  ChatController(
      {required this.initialMessageList, required this.scrollController});

  StreamController<List<MessageModel>> messageStreamController =
      StreamController();

  void dispose() {
    messageStreamController.close();
    scrollController.dispose();
  }

  void widgetReady() {
    if(!messageStreamController.isClosed) {
      messageStreamController.sink.add(initialMessageList);
    }
    if(initialMessageList.isNotEmpty) {
      scrollToLastMessage();
    }
  }

  @override
  void addMessage(MessageModel message) {
    // TODO: implement addMessage
  }

  @override
  void loadMoreData(List<MessageModel> messageList) {
    // TODO: implement loadMoreData
  }
  
  void scrollToLastMessage() {
    // todo
  }
}

abstract class IChatController {
  void addMessage(MessageModel message);

  void loadMoreData(List<MessageModel> messageList);
}
