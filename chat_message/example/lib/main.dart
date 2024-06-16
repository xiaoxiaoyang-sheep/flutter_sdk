import 'package:chat_message/core/chat_controller.dart';
import 'package:chat_message/models/message_model.dart';
import 'package:chat_message/widgets/chat_list_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatMessage Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ChatMessage Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  final List<MessageModel> _messageList = [
    MessageModel(
        ownerType: OwnerType.receiver,
        content: 'ChatGPT是有OpenAI研发的聊天机器人软件',
        createdAt: 1772058683000,
        id: 2,
        avatar: 'http://o.devio.org/images/o_as/avatar/tx2.jpeg',
        ownerName: 'ChatGPT'),
    MessageModel(
        ownerType: OwnerType.receiver,
        content: '介绍一下ChatGPT',
        createdAt: 1772058683000,
        id: 1,
        avatar: 'http://o.devio.org/images/o_as/avatar/tx18.jpeg',
        ownerName: 'Imooc')
  ];
  late ChatController chatController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: ChatList(
              chatController: chatController,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _send, child: const Text('Send'))
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    chatController = ChatController(
        initialMessageList: _messageList,
        scrollController: ScrollController(),
        timePellet: 60);
  }

  void _send() {
    chatController.addMessage(
      MessageModel(
          ownerType: OwnerType.sender,
          content: 'hello ${count++}',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          avatar: 'http://o.devio.org/images/o_as/avatar/tx2.jpeg',
          ownerName: 'Imooc'),
    );

    Future.delayed(const Duration(milliseconds: 2000), () {
      chatController.addMessage(MessageModel(
          ownerType: OwnerType.receiver,
          content: 'Nice',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          avatar: 'http://o.devio.org/images/o_as/avatar/tx2.jpeg',
          ownerName: 'ChatGPT'));
    });
  }
}
