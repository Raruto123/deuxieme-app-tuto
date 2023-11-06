import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/repositories/hashtag_repository.dart';
import 'package:equatable/equatable.dart';

part 'generate_hashtag_event.dart';
part 'generate_hashtag_state.dart';

class GenerateHashtagBloc extends Bloc<GenerateHashtagEvent, GenerateHashtagState> {

  final HashtagRepository hashtagRepository;

  GenerateHashtagBloc(
      this.hashtagRepository
      ) : super(const GenerateHashtagInitialState(0)) {
    on<OnChangeNumberHashtagEvent>((event, emit) {
      // TODO: implement event handler
      hashtagRepository.number = event.number;

      //lorsque tu mets les blocs ce qui est émi est propagé dans toute l'application
      //si tu ouvres flutter inspector tu verras que le bloc est haut dans les widgets
      emit(GenerateHashtagInitialState(event.number));
    });
    
    on<OnGenerateHashtagsEvent>((event, emit) async{
      List<HashtagModel> hashtagModel = await hashtagRepository.generate();

      emit(GenerateHashtagSuccessState(hashtagModel));
    });
  }
}
