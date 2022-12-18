import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rclient/elements/PaddingChip.dart';
import 'package:rclient/notifier.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _textfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        // add text box that have a search icon on the left and have placeholder name search
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width >
                        Provider.of<StaticNotifier>(context).minimumWidth
                    ? Provider.of<StaticNotifier>(context)
                        .minimumWidth
                        .toDouble()
                    : double.infinity,
                child: TextField(
                  controller: _textfieldController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textfieldController.clear();
                        },
                        icon: Icon(Icons.add),
                      )),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    PaddingChip(label: 'Furry', onPressed: () {}),
                    PaddingChip(label: 'Kaiju_Paradise', onPressed: () {}),
                    PaddingChip(label: 'Tiger-Shark', onPressed: () {}),
                    PaddingChip(label: '2.9.1', onPressed: () {}),
                  ])),
            )
          ],
        ));
  }
}
