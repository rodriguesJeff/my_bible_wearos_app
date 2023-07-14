import 'package:my_first_wear_os_app/data/models/abbrev_model.dart';

class BookModel {
  AbbrevModel? abbrev;
  String? name;
  String? author;
  String? group;
  String? version;

  BookModel({this.abbrev, this.name, this.author, this.group, this.version});

  BookModel.fromJson(Map<String, dynamic> json) {
    abbrev = json['abbrev'] != null
        ? new AbbrevModel.fromJson(json['abbrev'])
        : null;
    name = json['name'];
    author = json['author'];
    group = json['group'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abbrev != null) {
      data['abbrev'] = this.abbrev!.toJson();
    }
    data['name'] = this.name;
    data['author'] = this.author;
    data['group'] = this.group;
    data['version'] = this.version;
    return data;
  }
}
