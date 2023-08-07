import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/app/data/sms_model.dart';
import 'package:flash_chat/services/service_manager.dart';

class HomeService {
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    await userManager.removeUid();
  }

  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser!.delete();

    await userManager.removeUid();
  }

  static Future<void> sendMessage(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender?.email != '') {
      final db = FirebaseFirestore.instance;
      final Message message = Message(sender!.email!, sms);

      await db.collection('message').add(message.toMap());
    }
  }
}
