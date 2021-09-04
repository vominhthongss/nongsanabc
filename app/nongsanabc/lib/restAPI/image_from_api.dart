import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageFromApi extends StatelessWidget {
  const ImageFromApi({
    Key? key,
    required this.URL,
  }) : super(key: key);

  final String URL;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        fit: BoxFit.fitHeight,
        imageUrl: URL,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => CachedNetworkImage(
          imageUrl: URL,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
