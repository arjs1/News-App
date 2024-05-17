import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/core/api/api.dart';
import 'package:news_app/core/api/api_model.dart';
import 'package:news_app/core/utilis/news_data.dart';
import 'package:news_app/pages/newslistpage/widgets/image_placeholder.dart';
import 'package:news_app/pages/newslistpage/widgets/news_container.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final Api _api = Api();

  // Future<List<ApiModel>> newslist= Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Express News",
          style: TextStyle(
            color: Color.fromARGB(255, 51, 160, 54),
          ),
        ),
        actions: [
          SizedBox(
            width: 30,
          ),
          Icon(Icons.notifications_active_outlined),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.search),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: ListView.builder(
              itemCount: newsmodel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ImagePlaceholder(
                    newsImage: newsmodel[index].newsImage,
                    category: newsmodel[index].category,
                    title: newsmodel[index].title);
              },
            ),
          ),
          Container(
            child: FutureBuilder(
              future: _api.fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsContainer(
                        author: snapshot.data?[index].author,
                        title: snapshot.data?[index].title,
                        urlToImage: snapshot.data?[index].urlToImage,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Something went wrong");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
