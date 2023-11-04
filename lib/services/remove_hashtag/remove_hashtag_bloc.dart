import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/repositories/hashtag_repository.dart';
import 'package:equatable/equatable.dart';

part 'remove_hashtag_event.dart';
part 'remove_hashtag_state.dart';

class RemoveHashtagBloc extends Bloc<RemoveHashtagEvent, RemoveHashtagState> {

  final HashtagRepository hashtagRepository;


  RemoveHashtagBloc(
      this.hashtagRepository
      ) : super(RemoveHashtagInitial()) {
    on<OnRemoveHashtagEvent>((event, emit) async {
      // TODO: implement event handler

      await hashtagRepository.removeHashtag(event.hashtagModel);

      emit(
        RemoveHashtagSuccessState(
          timestamp: DateTime.now().millisecondsSinceEpoch
        )
      );

    });
  }
}
