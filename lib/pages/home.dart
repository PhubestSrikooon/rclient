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
  List<dynamic> _list = [];
  int _page = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<dynamic> _refresh() async {
    var response = await request.getFromSource(0, '');
    setState(() {
      _page = 0;
      _list = response;
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _refresh,
        child: _list.isNotEmpty
            ? MasonryGridView.builder(
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
                      imageUrl: _list[index]['sample']['url'],
                      description: _list[index]['description'],
                      tags: _list[index]['tags']['general'].join(', '),
                      artist: _list[index]['tags']['artist'].join(', '));
                },
                itemCount: _list.length)
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
