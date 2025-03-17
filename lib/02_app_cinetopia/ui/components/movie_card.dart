import 'package:flutter/material.dart';
import '../../app/models/movie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85,
          height: 124,
          decoration: BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage("${movie.imageUrlWithPrefix}"),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.only(right: 16),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                //textAlign: TextAlign.left,
                "${movie.title}",
                softWrap: true, // Permite quebrar o texto em várias linhas
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                //textScaler: TextScaler.linear(1),
                style: TextStyle(
                    color: Color(0xFFA5A5A5),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text("Lançamento: ${movie.releaseDate}",
                style: TextStyle(
                  color: Color(0xFFA5A5A5),
                  fontSize: 12,
                ))
          ],
        ),
      ],
    );
  }
}
