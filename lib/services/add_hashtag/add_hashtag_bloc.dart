import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/repositories/hashtag_repository.dart';
import 'package:meta/meta.dart';

part 'add_hashtag_event.dart';
part 'add_hashtag_state.dart';

class AddHashtagBloc extends Bloc<AddHashtagEvent, AddHashtagState> {

  final HashtagRepository hashtagRepository;

  AddHashtagBloc(
      this.hashtagRepository
      ) : super(AddHashtagInitial()) {
    on<OnAddHashtagEvent>((event, emit) {
      // TODO: implement event handler

      //print("test lorsque j'appuie sur le bouton d'ajout d'hashtag lorsque le champ n'est pas vide");

      //print(event.hashtag);

      // print(hashtag);
      hashtagRepository.addNewHashtag({
        "name" : event.hashtag
      }
      );

      //ce qui est émis par le bloc
      emit(AddHashtagSuccessState());
    });
  }
}
