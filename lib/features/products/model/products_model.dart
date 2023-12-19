class ProductsModel {
  String? id;
  String? description;
  String? url;
  int? price;

  ProductsModel.fromJson(Map<String, dynamic> json, String this.id) {
    description = json['description'];
    url = json['url'];
    price = json['price'];
  }
}
