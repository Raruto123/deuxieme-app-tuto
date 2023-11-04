//pour centraliser la gestion des données à un seul et même endroit
import 'dart:async';

import 'package:deuxieme_app_tuto/models/hashtag_model.dart';

class HashtagRepository {
  final List<Map<String, dynamic>> listHashtagsss;

  HashtagRepository({
    required this.listHashtagsss
}) {
    //converti listHashtagsss en list de hashtagModel
    List<HashtagModel> hashtags = listHashtagsss.map(
            (e) => HashtagModel(
                name: e["name"])).toList();

    //l'on fait cela pour ajouter des données dynamiquement avec StreamController
    _hashtagController.add(hashtags);
  }

  final StreamController<List<HashtagModel>> _hashtagController = StreamController<List<HashtagModel>>();


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
}