class Constant {
  static const String topHeadlines =
      "http://newsapi.org/v2/top-headlines?country=ph&apiKey=722d66ab54b543f3b23595ecfc605a4a";

  static String topCategories(String category) {
    return "http://newsapi.org/v2/top-headlines?country=ph&category=$category&apiKey=722d66ab54b543f3b23595ecfc605a4a";
  }
}
