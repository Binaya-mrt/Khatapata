// To parse this JSON data, do
//
//     final transcation = transcationFromJson(jsonString);

import 'dart:convert';

Transcation transcationFromJson(String str) =>
    Transcation.fromMap(json.decode(str));

String transcationToJson(Transcation data) => json.encode(data.toMap());

class Transcation {
  Transcation({
    this.id,
    required this.invoice,
    required this.date,
    required this.title,
    required this.rate,
    required this.total,
  });

  int? id;
  String invoice;
  String date;
  String title;
  String rate;
  String total;

  factory Transcation.fromMap(Map<String, dynamic> json) => Transcation(
      id: json["id"],
      invoice: json["invoice"],
      date: json["date"],
      title: json["title"],
      rate: json["rate"],
      total: json["total"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "invoice": invoice,
        "date": date,
        "title": title,
        "rate": rate,
        "total": total
      };
}
