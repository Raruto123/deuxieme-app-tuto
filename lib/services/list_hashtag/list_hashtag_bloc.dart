import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:meta/meta.dart';

import '../../repositories/hashtag_repository.dart';

part 'list_hashtag_event.dart';
part 'list_hashtag_state.dart';

class ListHashtagBloc extends Bloc<ListHashtagEvent, ListHashtagState> {
  //final List<Map<String, dynamic>> listHashtags;

  final HashtagRepository hashtagRepository;

  ListHashtagBloc(this.hashtagRepository) : super(ListHashtagInitialState(
      listHashtag: List<HashtagModel>.from([]))) {
    //pour écouter chaque mouvement/nouvelle donnée qu'on aura dans le stream hashtags dans le dossier hashtag_repository
    hashtagRepository.hashtags.listen((hashtags) {
      add(OnHashtagUpdatedListHashtagEvent(hashtagss: hashtags));
    });
    on<OnHashtagUpdatedListHashtagEvent>((event, emit) {
      // TODO: implement event handler
      //List<HashtagModel> listHashtagModel = listHashtags.map((e) => HashtagModel(
        //name: e["name"],
      //),
      //).toList();

      //ce qui est émis par le bloc
      emit(
       ListHashtagInitialState(listHashtag: event.hashtagss)
      );


    });
  }
}
