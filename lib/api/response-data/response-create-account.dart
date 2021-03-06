// To parse this JSON data, do
//
//     final responseCreateAccount = responseCreateAccountFromJson(jsonString);

import 'dart:convert';

ResponseCreateAccount responseCreateAccountFromJson(String str) => ResponseCreateAccount.fromJson(json.decode(str));

String responseCreateAccountToJson(ResponseCreateAccount data) => json.encode(data.toJson());

class ResponseCreateAccount {
  ResponseCreateAccount({
    this.context,
    this.id,
    this.type,
    this.responseCreateAccountId,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String context;
  String id;
  String type;
  String responseCreateAccountId;
  String address;
  int quota;
  int used;
  bool isDisabled;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory ResponseCreateAccount.fromJson(Map<String, dynamic> json) => ResponseCreateAccount(
    context: json["@context"] == null ? null : json["@context"],
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    responseCreateAccountId: json["id"] == null ? null : json["id"],
    address: json["address"] == null ? null : json["address"],
    quota: json["quota"] == null ? null : json["quota"],
    used: json["used"] == null ? null : json["used"],
    isDisabled: json["isDisabled"] == null ? null : json["isDisabled"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "@context": context == null ? null : context,
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "id": responseCreateAccountId == null ? null : responseCreateAccountId,
    "address": address == null ? null : address,
    "quota": quota == null ? null : quota,
    "used": used == null ? null : used,
    "isDisabled": isDisabled == null ? null : isDisabled,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
