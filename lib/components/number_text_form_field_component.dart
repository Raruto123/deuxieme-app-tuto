import 'package:deuxieme_app_tuto/services/generate_hashtag/generate_hashtag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTextFormFieldComponent extends StatefulWidget {
  const NumberTextFormFieldComponent({super.key});

  @override
  State<NumberTextFormFieldComponent> createState() => _NumberTextFormFieldComponentState();
}

class _NumberTextFormFieldComponentState extends State<NumberTextFormFieldComponent> {

  int _number = 0;

  late final TextEditingController _numberController =
  TextEditingController(
      text: "0"
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerateHashtagBloc, GenerateHashtagState>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is GenerateHashtagInitialState) {
      _numberController.text =(
        //et tu utilises context.read<nom du bloc>() pour importer le bloc
          context.read<GenerateHashtagBloc>().state as
          GenerateHashtagInitialState).number.toString().toString();
    }
    //pour transformer le 0 de hintText en vrai nombre
  },
  child: TextFormField(
      controller: _numberController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: "0",
          prefixIcon: IconButton(
              onPressed: () {
                if (_number == 0) {
                  return;
                }
                setState(() {
                  _number--;
                });
                //pour tenir compte du changement qui s'opère si number baisse
                context.read<GenerateHashtagBloc>()
                    .add(OnChangeNumberHashtagEvent(_number));

                _numberController.text = "$_number";
              },
              icon: Icon(Icons.minimize)
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _number++;
                });
                //pour tenir compte du changement qui s'opère si number augmente
                context.read<GenerateHashtagBloc>()
                    .add(OnChangeNumberHashtagEvent(_number));

                _numberController.text = "$_number";
              },
              icon: Icon(Icons.add)
          )
      ),
    ),
);
  }
}
