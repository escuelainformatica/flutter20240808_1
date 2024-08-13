class Book {
  int? id;
  String? name;
  String? autor;
  int? price;
  int? numPage;
  String? description;
  String? category;

  Book(
      {this.id,
        this.name,
        this.autor,
        this.price,
        this.numPage,
        this.description,
        this.category});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    autor = json['autor'];
    price = json['price'];
    numPage = json['numPage'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['autor'] = this.autor;
    data['price'] = this.price;
    data['numPage'] = this.numPage;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}