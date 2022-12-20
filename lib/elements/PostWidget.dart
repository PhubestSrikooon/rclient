import 'package:flutter/material.dart';

class PostImageWidget extends StatefulWidget {
  final String? imageUrl;
  final String? description;
  final String? tags;
  final String? artist;

  const PostImageWidget(
      {super.key, this.imageUrl, this.description, this.tags, this.artist});

  @override
  State<PostImageWidget> createState() => _PostImageWidgetState();
}

class _PostImageWidgetState extends State<PostImageWidget> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: () {
          // show image in full screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: Center(
                          child: Image.network(widget.imageUrl ?? '')))));
        },
        child: Column(
          children: [
            // if image is loading, show a loading indicator
            // if image is loaded, show the image
            // if image is failed to load, show a error message
            Image.network(widget.imageUrl ?? ''),
            // Text(widget.description ?? ''),
            // Text(widget.tags ?? ''),
            // Text(widget.artist ?? ''),
          ],
        ));
  }
}
