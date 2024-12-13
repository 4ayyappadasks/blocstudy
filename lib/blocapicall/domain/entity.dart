class Productentity {
  List<Product> products;
  int total;
  int skip;
  int limit;

  Productentity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

}

class Product {
  int id;
  String title;
  double price;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );
}
