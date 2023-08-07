import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Login out'),
                onTap: () async => await controller.logout(),
              ),
              PopupMenuItem(
                child: const Text('Delete'),
                onTap: () async => await controller.delete(),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          MessageStream(),
          SendContainer(
            onPressed: () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}

class SendContainer extends StatelessWidget {
  const SendContainer({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.red,
            width: 5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              minLines: 2,
              maxLines: 5,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.yellow, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.topRight),
        ),
      ),
    );
  }
}
