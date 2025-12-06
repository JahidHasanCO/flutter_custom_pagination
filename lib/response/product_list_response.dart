import 'package:scroll_test/models/product.dart';

class ProductListResponse {
    final List<Product>? products;
    final int? total;
    final int? skip;
    final int? limit;

    ProductListResponse({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory ProductListResponse.fromJson(Map<String, dynamic> json) => ProductListResponse(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );
}