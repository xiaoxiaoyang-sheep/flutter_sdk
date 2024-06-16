import 'package:chat_message/core/chat_controller.dart';
import 'package:chat_message/models/message_model.dart';
import 'package:chat_message/widgets/default_message_widget.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  /// ChatList 的控制器
  final ChatController chatController;
  final EdgeInsetsGeometry? padding;

  const ChatList({super.key, required this.chatController, this.padding});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  ChatController get chatController => widget.chatController;
  ScrollController get scrollController => chatController.scrollController;

  Widget get _chatStreamBuilder => StreamBuilder(
      stream: chatController.messageStreamController.stream,
      builder:
          (BuildContext context, AsyncSnapshot<List<MessageModel>> snapshot) {
        return snapshot.connectionState == ConnectionState.active
            ? ListView.builder(
                shrinkWrap: true,
                reverse: true,
                padding: widget.padding,
                controller: scrollController,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var model = snapshot.data![index];
                  // todo
                  return DefaultMessageWidget(key: model.key, message: model);
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      });

  @override
  Widget build(BuildContext context) {
    // 配合shrinkWrap: true 使用，解决数据少的时候数据底部对齐的问题
    return Align(
      alignment: Alignment.topCenter,
      child: _chatStreamBuilder,
    );
  }

  @override
  void initState() {
    super.initState();
    chatController.widgetReady();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  Widget _buildMessageWidget(
      {required GlobalKey<State<StatefulWidget>> key,
      required MessageModel message}) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: message.ownerType == OwnerType.receiver
              ? Colors.amberAccent
              : Colors.blue),
      child: Text('${message.ownerName} ${message.content} ${message.avatar}'),
    );
  }
}
