// File: widgets/product_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Image.network(
              product.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                );
              },
            ),
            const SizedBox(height: 8.0),
            // Nama produk
            Text(
              product.nama,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            // Harga produk
            Text(
              'Rp ${product.price}',
              style: const TextStyle(fontSize: 16.0, color: Colors.green),
            ),
            const SizedBox(height: 8.0),
            // Tombol tambah ke keranjang
            ElevatedButton(
              onPressed: () {
                // Memanggil fungsi addToCart dari CartCubit
                context.read<CartCubit>().addToCart(product);
                // Opsional: Tampilkan snackbar untuk feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.nama} ditambahkan ke keranjang'),
                  ),
                );
              },
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
