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
    if (!messageStreamController.isClosed) {
      messageStreamController.sink.add(initialMessageList);
    }
    if (initialMessageList.isNotEmpty) {
      scrollToLastMessage();
    }
  }

  @override
  void addMessage(MessageModel message) {
    if (messageStreamController.isClosed) return;
    // List反转后列是从下往上展示，所以新来的消息需要插入到数据第0个位置
    initialMessageList.insert(0, message);
    messageStreamController.sink.add(initialMessageList);
    scrollToLastMessage();
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
