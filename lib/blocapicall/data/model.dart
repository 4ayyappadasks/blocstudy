import 'package:flutterblocstudey/blocapicall/domain/entity.dart';

class Productsmodel extends Productentity{
  Productsmodel({required products, required total, required skip, required limit}):super(
    total: total,
    skip: skip,
    limit: limit,
    products: products
  );
  factory Productsmodel.fromJson(Map<String, dynamic> json) => Productsmodel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}