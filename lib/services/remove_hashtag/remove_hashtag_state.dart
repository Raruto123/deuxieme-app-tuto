part of 'remove_hashtag_bloc.dart';

abstract class RemoveHashtagState extends Equatable {
  const RemoveHashtagState();
}

class RemoveHashtagInitial extends RemoveHashtagState {
  @override
  List<Object> get props => [];
}

class RemoveHashtagSuccessState extends RemoveHashtagState{
  final int timestamp;

  RemoveHashtagSuccessState({
    required this.timestamp
});

  @override
  List<Object> get props => [timestamp];

}