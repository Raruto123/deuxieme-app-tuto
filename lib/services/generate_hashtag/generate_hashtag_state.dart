part of 'generate_hashtag_bloc.dart';

abstract class GenerateHashtagState extends Equatable {
  const GenerateHashtagState();
}

class GenerateHashtagInitialState extends GenerateHashtagState {

  final int number;

  const GenerateHashtagInitialState(this.number);
  //lorsque tu mets required this.number par exemple lorsque tu iras dans le bloc il
  //te faudra toujours mettre number : comme  argument en appelant le GenerateHashtagInitialState

  @override
  List<Object> get props => [];
}

class GenerateHashtagSuccessState extends GenerateHashtagState {

  final List<HashtagModel> hashtags;

  GenerateHashtagSuccessState(this.hashtags);
  //lorsque tu mets required this.number par exemple lorsque tu iras dans le bloc il
  //te faudra toujours mettre number : comme  argument en appelant le GenerateHashtagInitialState

  @override
  List<Object> get props => [hashtags];
}

