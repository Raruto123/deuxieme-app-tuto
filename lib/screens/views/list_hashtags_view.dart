import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListHashtagsView extends StatelessWidget {
  const ListHashtagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListHashtagBloc, ListHashtagState>(
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
                key: Key(index.toString()),
                background: const ColoredBox(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${listHashtag[index].name} supprimé")
                  )
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(listHashtag[index].name),
                  ),
                ),
              );
            }
        );
      },
    );
  }
}
