import 'package:flutter/material.dart';
import 'package:flutter_newsapp/controller/home_screen_controller.dart';
import 'package:flutter_newsapp/model/searchNews.dart';
import 'package:provider/provider.dart';


class SelectedNews extends StatefulWidget {


 final Article article;
  int? index;
   SelectedNews({super.key,this.index, required this.article });

  @override
  State<SelectedNews> createState() => _SelectedNewsState();
}

class _SelectedNewsState extends State<SelectedNews> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
     await context.read<HomeScreenController>().getallnews();
    },);
    super.initState();
  }
  Widget build(BuildContext context) {

   final selnews=context.watch<HomeScreenController>();

  final newsItem = widget.index != null
        ? selnews.alltopnews[widget.index!]
        : widget.article;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
            ),
            SizedBox(width: 8),
            Text(''),
          ],
        ),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              newsItem.urlToImage ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/50',
                        ),
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsItem.author ?? 'Unknown Author',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '@SamBlitz',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.facebook, color: Colors.blue),
                          SizedBox(width: 8),
                          Icon(Icons.brightness_2_outlined,
                              color: Colors.lightBlue),
                          SizedBox(width: 8),
                          Icon(Icons.wechat_sharp, color: Colors.green),
                          SizedBox(width: 8),
                          Icon(Icons.email, color: Colors.red),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Tuesday 19 September 2023 13:36, UK',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  // Title
                  Text(
                     newsItem.title ?? 'Unknown Author',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Content
                  Text(
                   newsItem.content ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    newsItem.url ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
