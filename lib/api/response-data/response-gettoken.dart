// To parse this JSON data, do
//
//     final gettoken = gettokenFromJson(jsonString);

import 'dart:convert';

Gettoken gettokenFromJson(String str) => Gettoken.fromJson(json.decode(str));

String gettokenToJson(Gettoken data) => json.encode(data.toJson());

class Gettoken {
  Gettoken({
    this.token,
    this.id,
  });

  String token;
  String id;

  factory Gettoken.fromJson(Map<String, dynamic> json) => Gettoken(
    token: json["token"] == null ? null : json["token"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "id": id == null ? null : id,
  };
}
