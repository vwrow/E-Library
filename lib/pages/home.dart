import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ukl_knya_keren/models/carousel_asset.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ukl_knya_keren/models/books_data.dart';
import 'package:ukl_knya_keren/pages/linimasa.dart';
import 'package:ukl_knya_keren/pages/pofile.dart';
import 'package:ukl_knya_keren/widgets/navBar.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int activeIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 93, 170),
      body: ListView(
        children: [
          _searchBar(),
          _carousel(),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: const Color.fromARGB(255, 232, 236, 242),
            ),
            child: Column(
              children: [_bookSection(), buildRekomendasi(), buildPopuler()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _navigateToPage,
      ),
    );
  }

  Widget _bookSection() {
    final books = bookData.getBooks();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
          child: Text(
            "Terakhir Diakses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: const EdgeInsets.only(left: 20),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _bookCard(books[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _bookCard(bookData data) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Container(
              width: 90,
              height: double.infinity,
              color: Colors.grey.shade300,
              child: data.imagePath.isEmpty
                  ? const Icon(Icons.broken_image, size: 35, color: Colors.grey)
                  : Image.asset(
                      data.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 35,
                          color: Colors.grey,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRekomendasi() {
    final books = bookData.getBooks();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
          child: Text(
            "Rekomendasi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _rekomendasiCard(books[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _rekomendasiCard(bookData data) {
    return Container(
      width: 120,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: data.imagePath.isEmpty
            ? const Icon(Icons.broken_image, size: 50, color: Colors.grey)
            : Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
      ),
    );
  }

  Widget buildPopuler() {
    final books = bookData.getBooks();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
          child: Text(
            "Populer",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _populerCardVertical(books[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _populerCardVertical(bookData data) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Container(
              height: 160,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: data.imagePath.isEmpty
                  ? const Icon(Icons.broken_image, size: 50, color: Colors.grey)
                  : Image.asset(
                      data.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStarRating(data.vote),
                const SizedBox(height: 8),
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.overview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Publisher: ${data.publisher}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(String vote) {
    double rating = double.tryParse(vote) ?? 0.0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 14);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 14);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 14);
        }
      }),
    );
  }

  Column _carousel() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 235,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              viewportFraction: 0.7,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            items: c_imageAsset.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(i, fit: BoxFit.fill),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        buildIndicator(),
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 40, right: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hoverColor: Colors.white,
          prefixIcon: Icon(Icons.search, size: 20),
          hintText: "Search..",
          hintStyle: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(187, 158, 158, 158),
          ),
          suffixIcon: Icon(Icons.sort, size: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: c_imageAsset.length,
    effect: ScrollingDotsEffect(
      dotHeight: 7,
      dotWidth: 7,
      activeDotColor: const Color.fromARGB(255, 232, 236, 242),
      dotColor: const Color.fromARGB(255, 22, 73, 152),
    ),
  );

  void _navigateToPage(int index) {
    if (index == _currentIndex) return;

    if (index == 0) {
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LinimasaPage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }
}
