part of 'remove_hashtag_bloc.dart';

abstract class RemoveHashtagEvent extends Equatable {
  const RemoveHashtagEvent();
}

class OnRemoveHashtagEvent extends RemoveHashtagEvent{

  final HashtagModel hashtagModel;

  OnRemoveHashtagEvent({
    required this.hashtagModel
});

  @override
  List<Object> get props => [hashtagModel];
}