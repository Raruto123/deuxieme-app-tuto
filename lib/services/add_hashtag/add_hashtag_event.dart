part of 'add_hashtag_bloc.dart';

@immutable
abstract class AddHashtagEvent {}

class OnAddHashtagEvent extends AddHashtagEvent{
  final String hashtag;

  OnAddHashtagEvent({
    required this.hashtag
});

}