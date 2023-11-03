import 'package:deuxieme_app_tuto/screens/home_screen.dart';
import 'package:deuxieme_app_tuto/screens/views/list_hashtags_view.dart';
import 'package:deuxieme_app_tuto/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  List<Map<String, dynamic>> get listHashtags => [
    {
      "name": "yesjj"
    }
  ];


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListHashtagBloc>(
          lazy: false,
          create: (context) => ListHashtagBloc(
              listHashtags
          )..add(OnInitalizeListHashtagEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta Tags',
        home: HomeScreen(),
      ),
    );
  }
}
