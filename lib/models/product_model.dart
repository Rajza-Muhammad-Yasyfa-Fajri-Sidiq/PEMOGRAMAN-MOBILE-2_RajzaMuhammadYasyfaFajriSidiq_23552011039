// File: models/product_model.dart

class ProductModel {
  final String id;
  final String nama;
  final String
  description; // Mengasumsikan "nama" kedua adalah "description" berdasarkan konteks umum, karena properti duplikat tidak valid.
  final int price;
  final String image;

  ProductModel({
    required this.id,
    required this.nama,
    required this.description,
    required this.price,
    required this.image,
  });

  // Metode untuk mengkonversi objek ke Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  // Factory method untuk membuat objek dari Map
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }
}
