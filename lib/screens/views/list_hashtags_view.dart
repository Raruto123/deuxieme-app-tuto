import 'package:flutter/material.dart';


final List<Map<String, dynamic>> listHashtags =[
  //{
    //"name" : "#fluter"
  //},
  //{
   // "name" : "#dart"
  //}
];

class ListHashtagsView extends StatelessWidget {
  const ListHashtagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return listHashtags.isEmpty ? const Center(
      child: Text("No Hashtags added"),
    ) :
    ListView.builder(
        itemCount: listHashtags.length,
        itemBuilder: (context, index) {
          return Dismissible(//permet de swiper pour supprimer
            key: Key(index.toString()),
            background: const ColoredBox(
              color: Colors.red,
            ),
              onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$index supprimé')
              )
              );
              },
              child: Card(
                child: ListTile(
                  title: Text(listHashtags[index]["name"]),
                ),
              ),
              );
        }
    );
  }
}
