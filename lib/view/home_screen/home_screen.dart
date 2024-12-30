import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapp/controller/catagorycontroller.dart';
import 'package:flutter_newsapp/controller/home_screen_controller.dart';

import 'package:flutter_newsapp/view/selected_news/selected_news.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CategoryController>().getCategories(); // Get categories initially
        context.read<HomeScreenController>().getallnews(); // Fetch all top news
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final catdata = context.watch<CategoryController>();
    final news = context.watch<HomeScreenController>();

    return Scaffold(
      backgroundColor: Color(0xff152536),
      appBar: AppBar(
        backgroundColor: Color(0xff152536),
        title: Text(
          'Top Headlines',
          style: GoogleFonts.roboto(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_add_sharp,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(''), 
              radius: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    catdata.categories.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            catdata.categorySelection(clickedIndex: index); 
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 77, 126, 210),
                            ),
                            child: Text(
                              catdata.categories[index],
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              
              CarouselSlider(
                items: List.generate(
                  news.alltopnews.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              news.alltopnews[index].urlToImage ?? '',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.alltopnews[index].title ?? 'null',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 12 / 10,
                  viewportFraction: 0.8,
                  initialPage: 2,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 30),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Read',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),

              ListView.builder(
                itemCount: catdata.newsTopics.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            final selectedArticle = catdata.newsTopics[index];
                            // Use Navigator.push to navigate to SelectedNews
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SelectedNews(   article: selectedArticle,
        index: index,),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              catdata.newsTopics[index].urlToImage ?? '',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                catdata.newsTopics[index].title ?? '',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  CircleAvatar(radius: 15),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Text(
                                      catdata.newsTopics[index].author ?? '',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
//                                 IconButton(
//   icon: Icon(
//     Icons.bookmark,
//     color: Colors.blue,
//     size: 30,
//   ),
//   onPressed: () {
//     final news = {
//       'title': 'Your News Title', // Replace with actual news title
//       'image': 'https://example.com/news_image.jpg', // Replace with actual news image URL
//     };

//     // Add the news to the saved news
//     context.read<SavedNewsController>().addNews(
//       context: context,
//       title: news['title']!,
//       image: news['image']!,
//     );
//   },
// )

                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                catdata.newsTopics[index].description ?? '',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
