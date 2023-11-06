//pour centraliser la gestion des données à un seul et même endroit
import 'dart:async';
import 'dart:math';

import 'package:deuxieme_app_tuto/models/hashtag_model.dart';

class HashtagRepository {
  final List<Map<String, dynamic>> listHashtagsss;
  int numberHashtags;

  HashtagRepository({
    required this.listHashtagsss,
    this.numberHashtags = 0
}) {
    //converti listHashtagsss en list de hashtagModel
    List<HashtagModel> hashtags = listHashtagsss.map(
            (e) => HashtagModel(
                name: e["name"])).toList();

    //l'on fait cela pour ajouter des données dynamiquement avec StreamController
    _hashtagController.add(hashtags);
  }

  final StreamController<List<HashtagModel>> _hashtagController = StreamController<List<HashtagModel>>();

  int get number => numberHashtags;
  set number (int value) => numberHashtags = value;


  Stream<List<HashtagModel>> get hashtags => _hashtagController.stream;

  Future<void> addNewHashtag(Map<String, dynamic> data) async{
    listHashtagsss.add(data);

    List<HashtagModel> hashtags = listHashtagsss.map(
            (e) => HashtagModel(
            name: e["name"])).toList();

    _hashtagController.add(hashtags);
  }
  //     Stream.value(listHashtags.map((e) => HashtagModel(
  //     name: e["name"])).toList()
  // );

Future<void> removeHashtag(HashtagModel hashtagModel) async {
    //la fonction qui permet de supprimer les éléments
    listHashtagsss.removeWhere((element) => element["name"] == hashtagModel.name);

    List<HashtagModel> hashtags = listHashtagsss.map(
            (e) => HashtagModel(
            name: e["name"])).toList();

    _hashtagController.add(hashtags);

}

Future<List<HashtagModel>> generate() async {
    listHashtagsss.shuffle();

    // Assurez-vous que numberHashtags est inférieur ou égal à la longueur de listHashtagsss.
    if (numberHashtags > listHashtagsss.length) {
      numberHashtags = listHashtagsss.length;
    }

    List<HashtagModel> hashtags = listHashtagsss.sublist(0, numberHashtags).map(
            (e) => HashtagModel(
            name: e["name"])).toList();

    return hashtags;
}

}