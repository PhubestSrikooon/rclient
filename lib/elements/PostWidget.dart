import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:rclient/notifier.dart';

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
            CachedNetworkImage(
              imageUrl: widget.imageUrl ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Text(widget.description ?? ''),
            // Text(widget.tags ?? ''),
            // Text(widget.artist ?? ''),
          ],
        ));
  }
}
