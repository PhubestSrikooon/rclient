import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rclient/elements/PostWidget.dart';
import 'package:rclient/worker/query.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Request request = Request();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: request.get(0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = jsonDecode(snapshot.data?.body ?? '')['posts'];
          return MasonryGridView.builder(
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 300
                    ? (MediaQuery.of(context).size.width / 300).floor()
                    : 1, // number of columns
              ),
              itemBuilder: (context, index) {
                return PostImageWidget(
                    imageUrl: data[index]['sample']['url'],
                    description: data[index]['description'],
                    tags: data[index]['tags']['general'].join(', '),
                    artist: data[index]['tags']['artist'].join(', '));
              },
              itemCount: data.length);
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
