class Product {
    final int? id;
    final String? title;
    final String? description;
    final double? price;
    final double? discountPercentage;
    final double? rating;
    final int? stock;
    final List<String>? tags;
    final String? brand;
    final String? sku;
    final int? weight;
    final String? warrantyInformation;
    final String? shippingInformation;
    final int? minimumOrderQuantity;
    final List<String>? images;
    final String? thumbnail;

    Product({
        this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.warrantyInformation,
        this.shippingInformation,
        this.minimumOrderQuantity,
        this.images,
        this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
    );
}
