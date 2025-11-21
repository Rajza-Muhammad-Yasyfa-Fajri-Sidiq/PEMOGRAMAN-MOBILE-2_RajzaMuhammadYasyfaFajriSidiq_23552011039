// File: blocs/cart_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

// Kelas untuk item di cart
class CartItem {
  final ProductModel product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  // Method untuk menghitung harga total item ini
  double get totalPrice => product.price * quantity;

  // CopyWith untuk immutability
  CartItem copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

// State untuk Cart
class CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartState({
    required this.items,
    required this.totalPrice,
  });

  // Factory untuk initial state
  factory CartState.initial() {
    return CartState(
      items: [],
      totalPrice: 0.0,
    );
  }

  // CopyWith untuk membuat state baru
  CartState copyWith({
    List<CartItem>? items,
    double? totalPrice,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  // Method untuk menghitung total harga dari items
  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
}

// Cubit untuk mengelola state cart
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  // Menambahkan produk ke cart
  void addToCart(ProductModel product) {
    final existingIndex = state.items.indexWhere((item) => item.product.id == product.id);
    List<CartItem> updatedItems;

    if (existingIndex != -1) {
      // Jika produk sudah ada, tambah quantity
      final existingItem = state.items[existingIndex];
      updatedItems = List.from(state.items);
      updatedItems[existingIndex] = existingItem.copyWith(quantity: existingItem.quantity + 1);
    } else {
      // Jika belum ada, tambah item baru
      updatedItems = List.from(state.items)..add(CartItem(product: product, quantity: 1));
    }

    final newTotalPrice = _calculateTotalPrice(updatedItems);
    emit(state.copyWith(items: updatedItems, totalPrice: newTotalPrice));
  }

  // Menghapus produk dari cart
  void removeFromCart(ProductModel product) {
    final updatedItems = state.items.where((item) => item.product.id != product.id).toList();
    final newTotalPrice = _calculateTotalPrice(updatedItems);
    emit(state.copyWith(items: updatedItems, totalPrice: newTotalPrice));
  }

  // Mengupdate quantity produk
  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      // Jika qty <= 0, hapus produk
      removeFromCart(product);
      return;
    }

    final existingIndex = state.items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      final updatedItems = List.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(quantity: qty);
      final newTotalPrice = _calculateTotalPrice(updatedItems);
      emit(state.copyWith(items: updatedItems, totalPrice: newTotalPrice));
    }
  }

  // Helper method untuk menghitung total harga
  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);


  // Di dalam class CartCubit
void clearCart() {
  emit(CartState.initial());

  
}