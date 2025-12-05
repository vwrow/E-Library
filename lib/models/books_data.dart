class bookData {
  String id;
  String title;
  String overview;
  String publisher;
  String status;
  String vote;
  String imagePath;

  bookData({
    required this.id,
    required this.title,
    required this.overview,
    required this.publisher,
    required this.status,
    required this.vote,
    required this.imagePath,
  });
  
  static List<bookData> getBooks() {
    List<bookData> news = [];
    news.add(
      bookData(
        id: "1",
        title: "Jejak Sang Penjelajah",
        overview:
            "Sebuah kisah tentang perjalanan seorang pemuda yang berani menembus hutan terlarang demi mencari ayahnya.",
        publisher: "Nusantara Press",
        status: "Available",
        vote: "5.0",
        imagePath: "assets/cover/1.jpg",
      ),
    );

    news.add(
      bookData(
        id: "2",
        title: "Rahasia Kota Awan",
        overview:
            "Novel fantasi tentang kota terapung di langit yang menyimpan teknologi kuno dan misteri besar.",
        publisher: "Langit Biru Publishing",
        status: "Available",
        vote: "4.0",
        imagePath: "assets/cover/2.jpg",
      ),
    );

    news.add(
      bookData(
        id: "3",
        title: "Algoritma Kehidupan",
        overview:
            "Buku pengantar ringan bagi pemula untuk memahami logika komputasi dan dasar-dasar pemrograman modern.",
        publisher: "Digital Insight",
        status: "Available",
        vote: "4.0",
        imagePath: "assets/cover/3.jpg",
      ),
    );

    news.add(
      bookData(
        id: "4",
        title: "Psikologi Senyap",
        overview:
            "Eksplorasi mendalam tentang cara pikiran bekerja ketika manusia berada dalam tekanan mental.",
        publisher: "MindSphere",
        status: "Out of Stock",
        vote: "4.0",
        imagePath: "assets/cover/4.jpg",
      ),
    );

    news.add(
      bookData(
        id: "5",
        title: "Atlas Laut Nusantara",
        overview:
            "Buku referensi mengenai ekosistem laut Indonesia, dilengkapi ilustrasi biota laut dan peta konservasi.",
        publisher: "Maritim Indonesia",
        status: "Available",
        vote: "5.0",
        imagePath: "assets/cover/5.jpg",
      ),
    );

    return news;
  }
}
