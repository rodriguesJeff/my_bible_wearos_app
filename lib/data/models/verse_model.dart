import 'package:my_first_wear_os_app/data/models/book_model.dart';

class VerseModel {
  BookModel? book;
  int? chapter;
  int? number;
  String? text;

  VerseModel({this.book, this.chapter, this.number, this.text});

  VerseModel.fromJson(Map<String, dynamic> json) {
    book = json['book'] != null ? new BookModel.fromJson(json['book']) : null;
    chapter = json['chapter'];
    number = json['number'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    data['chapter'] = this.chapter;
    data['number'] = this.number;
    data['text'] = this.text;
    return data;
  }
}
