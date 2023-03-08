import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yes_watching_core/yes_watching_core.dart';

import '../../domain/entities/movie.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Movie item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 180,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${item.posterPath}',
                placeholder: (_, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          Text(
            item.title ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(color: titleColor),
          ),
        ],
      ),
    );
  }
}
