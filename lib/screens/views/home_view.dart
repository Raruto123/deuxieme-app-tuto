import 'package:deuxieme_app_tuto/components/number_text_form_field_component.dart';
import 'package:deuxieme_app_tuto/models/hashtag_model.dart';
import 'package:deuxieme_app_tuto/services/generate_hashtag/generate_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _copyToClipboard(
      BuildContext context,
      GenerateHashtagSuccessState state,
      List<HashtagModel> hashtags
      ) async {
    final String listHashtags =
    state.hashtags.map((e) => "#${e.name}").join(" ");

    //permettre le fait de copier ce qu'on génère
    await Clipboard.setData(ClipboardData(text: listHashtags));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hashtags copied to clipboard")
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child:  NumberTextFormFieldComponent(),
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  context.read<GenerateHashtagBloc>().add(
                      OnGenerateHashtagsEvent());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Generate"),
                    ),
                    Icon(
                        Icons.copy,
                        size: 18
                    )
                  ],
                )),
          ),
          Expanded(
            child: BlocConsumer<GenerateHashtagBloc, GenerateHashtagState>(
              listener: (context, state) async{
                // TODO: implement listener
                if (state is GenerateHashtagSuccessState) {
                  _copyToClipboard(context, state, state.hashtags);
                  // final String listHashtags = state.hashtags.map((e) => "#${e.name}").join(" ");
                  //
                  // //permettre le fait de copier ce qu'on génère
                  // await Clipboard.setData(ClipboardData(text: listHashtags));
                  //
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //     content: Text("Hashtags copied to clipboard")
                  // )
                  // );
                }
              },
              builder: (context, state) {
                return BlocBuilder<GenerateHashtagBloc, GenerateHashtagState>(
                  builder: (context, state) {
                    if (state is GenerateHashtagSuccessState) {
                      return ListView.builder(
                          itemCount: state.hashtags.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: Key("$index-${DateTime.now().millisecondsSinceEpoch}"),
                                background: const ColoredBox(
                                  color: Colors.red,
                                ),
                                onDismissed: (direction) {
                                  state.hashtags.removeAt(index);

                                  _copyToClipboard(context, state, state.hashtags);
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(state.hashtags[index].name),
                                  ),
                                )
                            );
                          }
                      );
                    }
                    return Container(
                      height: 50.0,
                      child: const Center(child: Text("No hashtags generated")),
                    )
                    ;
                    return Container();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
