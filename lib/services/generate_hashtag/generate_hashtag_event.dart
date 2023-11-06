part of 'generate_hashtag_bloc.dart';

abstract class GenerateHashtagEvent extends Equatable {
  const GenerateHashtagEvent();
}

//cet évènement va récupérer la valeur dans le controller
class OnChangeNumberHashtagEvent extends GenerateHashtagEvent{
  final int number;

  OnChangeNumberHashtagEvent(this.number);

  @override
  List<Object> get props => [number];

}

class OnGenerateHashtagsEvent extends GenerateHashtagEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
