import 'dart:convert';
import 'package:flutter/material.dart';

class Note {
  int id;
  String title;
  String content;
  DateTime date_created;
  DateTime date_last_edited;
  Color note_color;
  Color content_color;
  int is_archived = 0;
  Note(this.id, this.title, this.content, this.date_created, this.date_last_edited,this.note_color,this.content_color);

   Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
//      'id': id,  since id is auto incremented in the database we don't need to send it to the insert query.
      'title': utf8.encode(title),
      'content': utf8.encode( content ),
      'date_created': epochFromDate( date_created ),
      'date_last_edited': epochFromDate( date_last_edited ),
      'note_color': note_color.value,
      'content_color':content_color.value,
      'is_archived': is_archived  //  for later use for integrating archiving
    };
    if(forUpdate){
      data["id"] = this.id;
    }
    return data;
  }
  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000 ;
}
void archiveThisNote() {
      is_archived = 1;
}

@override toString() {
  return {
    'id': id,
    'title': title,
    'content': content ,
    'date_created': epochFromDate( date_created ),
    'date_last_edited': epochFromDate( date_last_edited ),
    'note_color': note_color.toString(),
    'content_color':content_color.toString(),
    'is_archived':is_archived
  }.toString();
}

}