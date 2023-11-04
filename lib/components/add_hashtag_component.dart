import 'package:deuxieme_app_tuto/services/add_hashtag/add_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddHashtagComponent extends StatefulWidget {
  const AddHashtagComponent({super.key});

  @override
  State<AddHashtagComponent> createState() => _AddHashtagComponentState();
}

class _AddHashtagComponentState extends State<AddHashtagComponent> {

 final TextEditingController _controller = TextEditingController();

 @override
  void dispose() {
    // TODO: implement dispose
   _controller.dispose();
    super.dispose();
  }

  void _modal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => BlocListener<AddHashtagBloc, AddHashtagState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AddHashtagSuccessState){
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Hashtag ajouté")
              )
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Hashtag Creator",
                      style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    //un controller pour gérer l'état des différentes données du textefield
                    controller: _controller,//avec cette ligne lorsque tu saisis les informations dans le textfield ces informations vont se loger dans le _controller
                    decoration: const InputDecoration(
                        hintText: "Enter your hashtags"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel".toUpperCase())
                      ),
                      TextButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty){
                              context.read<AddHashtagBloc>().add(
                                  OnAddHashtagEvent(hashtag: _controller.text)
                              );//je déclenche un évènement
                              //l'évènement va envoyer le controller.text dans le formulaire au système d'évènement bloc


                              _controller.clear();
                            }else{
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Hashtag ne peut pas être vide"),

                              )
                              );
                            }

                            _controller.clear();//pour supprimer les données inscrites
                          },
                          child: Text("Add".toUpperCase())
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _modal(context);
      },
      child: const Icon(Icons.add),
    );
  }
}


