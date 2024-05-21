import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  final String? author;
  final String title;

  final String? urlToImage;

  const NewsContainer(
      {super.key, this.author, this.urlToImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                urlToImage ?? "",
                fit: BoxFit.cover,
                height: 150,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('Issue');
                },
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  author ?? "N/A",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
