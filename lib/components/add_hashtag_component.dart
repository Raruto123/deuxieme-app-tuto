import 'package:flutter/material.dart';

class AddHashtagComponent extends StatelessWidget {
  const AddHashtagComponent({super.key});

  void _modal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Hashtag Creator",
                    style: Theme.of(context).textTheme.headline6
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
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
                        onPressed: () {},
                        child: Text("Add".toUpperCase())
                    )
                  ],
                ),
              )
            ],
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
