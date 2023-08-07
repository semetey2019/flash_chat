import 'dart:convert';

class Message {
  Message(this.sender, this.sms);

  final String sender;
  final String sms;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sender': sender});
    result.addAll({'sms': sms});

    return result;
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      map['sender'] ?? '',
      map['sms'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}
