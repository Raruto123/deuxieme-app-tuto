part of 'list_hashtag_bloc.dart';

@immutable
abstract class ListHashtagEvent {}


//class OnInitalizeListHashtagEvent extends ListHashtagEvent{};


class OnHashtagUpdatedListHashtagEvent extends ListHashtagEvent{
  final List<HashtagModel> hashtagss;

  OnHashtagUpdatedListHashtagEvent({
    required this.hashtagss
});

  @override
  List<Object> get props =>[hashtagss];
}