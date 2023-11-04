import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:deuxieme_app_tuto/services/remove_hashtag/remove_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListHashtagsView extends StatelessWidget {
  const ListHashtagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListHashtagBloc, ListHashtagState>(
      listener: (context, state) {
        if (state is RemoveHashtagSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("hashtag supprimé")
          )
          );
        }
      },
      builder: (context, state) {
        List<HashtagModel> listHashtag = [];

        if (state is ListHashtagInitialState) {
         listHashtag = state.listHashtag;
        }

        return listHashtag.isEmpty ? const Center(
          child: Text("No Hashtags added"),
        ) :
        ListView.builder(
            itemCount: listHashtag.length,
            itemBuilder: (context, index) {
              return Dismissible(//permet de swiper pour supprimer
                //le problème de "A dismissed Dismissible widget is still part of the tree" c'est dans Key
                key: Key("${index.toString()} - ${DateTime.now().millisecondsSinceEpoch}"),
                background: const ColoredBox(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  context.read<RemoveHashtagBloc>().add(OnRemoveHashtagEvent(
                      hashtagModel: listHashtag[index])
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text("#${listHashtag[index].name}"),
                  ),
                ),
              );
            }
        );
      },
    );
  }
}
