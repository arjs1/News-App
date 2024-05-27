import 'package:flutter/material.dart';
import 'package:news_app/core/api/api.dart';
import 'package:news_app/core/payment/esewa_payment.dart';
import 'package:news_app/core/utilis/news_data_constant.dart';
import 'package:news_app/features/login/controller/login_view_model.dart';
import 'package:news_app/features/news/controller/news_provider.dart';
import 'package:news_app/features/news/widgets/image_placeholder.dart';
import 'package:news_app/features/news/widgets/news_container.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final Api _api = Api();

  int counter = 0;

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
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Express News $counter",
          style: const TextStyle(
            color: Color.fromARGB(255, 51, 160, 54),
          ),
        ),
        actions: const [
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
      body: ChangeNotifierProvider(
        create: (context) => NewsProvider(),
        child: ListView(
          children: [
            Consumer<NewsProvider>(builder: (context, value, _) {
              return Text(value.buttonText);
            }),

            MaterialButton(
              onPressed: () {
                Provider.of<LoginProvider>(context, listen: false).increment();
              },
              child: const Text("data"),
            ),
            // Consumer<LoginProvider>(
            //   builder: (BuildContext context, value, Widget? child) {
            //     return Text(value.counter.toString());
            //   },
            // ),
            MaterialButton(
              color: Colors.green,
              child: const Text("Esewa"),
              onPressed: () {
                EsewaService().useEsewa();
              },
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: newsmodel.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ImagePlaceholder(
                    newsImage: newsmodel[index].newsImage,
                    category: newsmodel[index].category,
                    title: newsmodel[index].title,
                  );
                },
              ),
            ),
            FutureBuilder(
              future: _api.fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsContainer(
                        author: snapshot.data?[index].author,
                        title: snapshot.data![index].getTitle,
                        urlToImage: snapshot.data?[index].urlToImage,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Something went wrong");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
