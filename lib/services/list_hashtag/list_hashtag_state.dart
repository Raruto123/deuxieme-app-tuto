part of 'list_hashtag_bloc.dart';

@immutable
abstract class ListHashtagState {}

class ListHashtagInitialState extends ListHashtagState {
  final List <HashtagModel> listHashtag;

  ListHashtagInitialState({
    required this.listHashtag
  });

//equatable sert à comparer nos différentes versions de ListHashtagInitialState
@override
  List<Object> get props => [listHashtag];

}
