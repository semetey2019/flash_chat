import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/app/data/sms_model.dart';
import 'package:flutter/cupertino.dart';
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
          MessageStream(controller.streamMessage()),
          SendContainer(
            controller: controller.smsController,
            onPressed: () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}

class SendContainer extends StatelessWidget {
  const SendContainer({
    Key? key,
    this.onPressed,
    this.controller,
  }) : super(key: key);

  final void Function()? onPressed;
  final TextEditingController? controller;

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
              controller: controller,
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
  MessageStream(
    this.streamMessage, {
    super.key,
  });

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.yellow, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.topRight),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: streamMessage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: unnecessary_cast
              final message = (snapshot.data!.docs.reversed as Iterable).map(
                  (e) => Message.fromMap(
                        e.data(),
                      )..isMy = e.data()['sender'] ==
                          FirebaseAuth.instance.currentUser?.email);

              return ListView(
                children: message
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.fromLTRB(!e.isMy! ? 10 : width / 2,
                            7, e.isMy! ? 10 : width / 3, 7),
                        child: Material(
                          color: !e.isMy! ? theme.onError : theme.background,
                          clipBehavior: Clip.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: !e.isMy!
                                  ? Radius.circular(0)
                                  : Radius.circular(0),
                              topRight: !e.isMy!
                                  ? Radius.circular(20)
                                  : Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                !e.isMy!
                                    ? Row(
                                        children: [
                                          Text(e.sender),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                Text(e.sms),
                                Text(e.dateTime.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
