import 'package:deuxieme_app_tuto/repositories/hashtag_repository.dart';
import 'package:deuxieme_app_tuto/screens/home_screen.dart';
import 'package:deuxieme_app_tuto/screens/views/list_hashtags_view.dart';
import 'package:deuxieme_app_tuto/services/add_hashtag/add_hashtag_bloc.dart';
import 'package:deuxieme_app_tuto/services/generate_hashtag/generate_hashtag_bloc.dart';
import 'package:deuxieme_app_tuto/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:deuxieme_app_tuto/services/remove_hashtag/remove_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Map<String, dynamic>> listHashtags = [
  {
    "name": "yesjj"
  },
  {
    "name": "yesjj"
  },
  {
    "name": "yesjj"
  },
  {
    "name": "yesjj"
  },
  {
    "name": "yesjj"
  }
];


void main() {
  runApp( App());
}

class App extends StatelessWidget {
  App({super.key});
  // This widget is the root of your application.
  final HashtagRepository hashtagRepository = HashtagRepository(
      listHashtagsss : listHashtags
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListHashtagBloc>(
          lazy: false,
          create: (context) => ListHashtagBloc(
              hashtagRepository
          ),
        ),
        BlocProvider<AddHashtagBloc>(
            create: (context) => AddHashtagBloc(
              hashtagRepository
            ),
        ),
        BlocProvider<RemoveHashtagBloc>(
            create: (context) => RemoveHashtagBloc(
                hashtagRepository
            ),
        ),
        BlocProvider<GenerateHashtagBloc>(
            create: (context) => GenerateHashtagBloc(
              hashtagRepository
            )..add(OnChangeNumberHashtagEvent(0)),
          //c'est la valeur qu'on décide d'initialiser au lancement de l'application
          //si je mets 10 ça va être 10 par défaut
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta Tags',
        home: HomeScreen(),
      ),
    );
  }
}
