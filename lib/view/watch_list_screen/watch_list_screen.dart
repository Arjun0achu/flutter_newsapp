import 'package:flutter/material.dart';

import 'package:flutter_newsapp/controller/saved_news_controller.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<SavedNewsController>().getSavedNews();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final savedNewsController = context.watch<SavedNewsController>();
    final savedNews = savedNewsController.savedNews; // Access saved news
    // final newsController = context.watch<HomeScreenController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Watchlist"),
      ),
      body: savedNews.isEmpty
          ? Center(
              child: Text(
                "No saved news available.",
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: savedNews.length,
              itemBuilder: (context, index) {
                final news = savedNews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          news['image'] ?? '',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news['title'] ?? '',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.black,
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
                                    'Author Name', // Replace with an actual author if available
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[700],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<SavedNewsController>()
                                        .removeNews(id: news['id']);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
