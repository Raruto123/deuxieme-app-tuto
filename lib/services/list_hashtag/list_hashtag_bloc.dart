import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:meta/meta.dart';

part 'list_hashtag_event.dart';
part 'list_hashtag_state.dart';

class ListHashtagBloc extends Bloc<ListHashtagEvent, ListHashtagState> {
  final List<Map<String, dynamic>> listHashtags;

  ListHashtagBloc(this.listHashtags) : super(ListHashtagInitialState(listHashtag: List<HashtagModel>.from([]))) {
    on<OnInitalizeListHashtagEvent>((event, emit) {
      // TODO: implement event handler
      List<HashtagModel> listHashtagModel = listHashtags.map((e) => HashtagModel(
        name: e["name"],
      ),
      ).toList();

      emit(
        ListHashtagInitialState(listHashtag: listHashtagModel)
      );
    });
  }
}
