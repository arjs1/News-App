import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String newsImage;
  final String category;
  final String title;
  const ImagePlaceholder({
    super.key,
    required this.newsImage,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(newsImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 51, 160, 54),
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
