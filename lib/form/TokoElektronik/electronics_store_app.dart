import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'checkout_screen.dart';
import 'product_detail_screen.dart';

class ElectronicsStoreApp extends StatefulWidget {
  const ElectronicsStoreApp({super.key});

  @override
  State<ElectronicsStoreApp> createState() => _ElectronicsStoreAppState();
}

class _ElectronicsStoreAppState extends State<ElectronicsStoreApp> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _products = [
    {
      "id": 101,
      "name": "Smartphone Pro Max 15",
      "category": "Smartphones",
      "price": 999.0,
      "originalPrice": 1199.0,
      "rating": 4.9,
      "isFavorite": true,
      "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500",
      "description": "Layar Super Retina XDR 6.7 inci, chip kencang performa tinggi, dan sistem kamera profesional 48MP dengan kualitas perekaman video 4K cinematic.",
      "sizes": ["128GB", "256GB", "512GB", "1TB"]
    },
    {
      "id": 102,
      "name": "Laptop Ultra Slim M3 Pro",
      "category": "Laptops",
      "price": 1299.0,
      "originalPrice": 1499.0,
      "rating": 4.8,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500",
      "description": "Laptop ultra tipis dengan layar Liquid Retina 14 inci, chip M3 ultra efisien, RAM 16GB, dan ketahanan baterai hingga 18 jam penuh.",
      "sizes": ["256GB SSD", "512GB SSD", "1TB SSD"]
    },
    {
      "id": 103,
      "name": "Wireless Noise Cancelling ANC",
      "category": "Audio",
      "price": 299.0,
      "originalPrice": 349.0,
      "rating": 4.7,
      "isFavorite": true,
      "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
      "description": "Headphone nirkabel dengan teknologi Active Noise Cancelling (ANC) terbaik, baterai tahan 30 jam, dan kualitas mikrofon jernih.",
      "sizes": ["Black Edition", "Silver White", "Navy Blue"]
    },
    {
      "id": 104,
      "name": "Smartwatch Series 9 GPS",
      "category": "Wearables",
      "price": 399.0,
      "originalPrice": 450.0,
      "rating": 4.6,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
      "description": "Smartwatch canggih dengan pemantau detak jantung EKG, sensor oksigen darah SpO2, pelacakan olahraga presisi, dan tahan air 50m.",
      "sizes": ["41mm Rubber", "45mm Rubber", "45mm Stainless"]
    },
    {
      "id": 105,
      "name": "Mechanical RGB Gaming Keyboard",
      "category": "Accessories",
      "price": 85.0,
      "originalPrice": 110.0,
      "rating": 4.8,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500",
      "description": "Keyboard mekanikal 75% hot-swappable dengan switch kustom, pencahayaan RGB per tombol, dan koneksi triple mode (Type-C, 2.4G, Bluetooth).",
      "sizes": ["Red Switch", "Blue Switch", "Brown Switch"]
    },
    {
      "id": 106,
      "name": "Wireless Ergonomic Mouse",
      "category": "Accessories",
      "price": 69.0,
      "originalPrice": 89.0,
      "rating": 4.5,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=500",
      "description": "Mouse nirkabel desain ergonomis dengan roda gulir ultra cepat MagSpeed, sensor 8000 DPI yang presisi di berbagai permukaan, dan klik hening.",
      "sizes": ["Graphite Gray", "Pale White"]
    },
    {
      "id": 107,
      "name": "Portable Bluetooth Speaker Bass+",
      "category": "Audio",
      "price": 120.0,
      "originalPrice": 150.0,
      "rating": 4.9,
      "isFavorite": true,
      "image": "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500",
      "description": "Speaker portabel tangguh sertifikasi IP67 anti air dan debu. Suara bass bertenaga dengan baterai kuat tahan hingga 20 jam non-stop.",
      "sizes": ["Standard Black", "Forest Green", "Camouflage"]
    },
    {
      "id": 108,
      "name": "4K Ultra HD Gaming Monitor 27\"",
      "category": "Accessories",
      "price": 450.0,
      "originalPrice": 520.0,
      "rating": 4.7,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500",
      "description": "Monitor gaming 27 inci IPS 4K UHD dengan refresh rate 144Hz, response time 1ms, HDR400, dan dukungan NVIDIA G-Sync untuk visual mulus.",
      "sizes": ["27 Inch IPS", "32 Inch Curved"]
    },
    {
      "id": 109,
      "name": "Fast Power Bank 20000mAh 65W",
      "category": "Accessories",
      "price": 49.0,
      "originalPrice": 65.0,
      "rating": 4.6,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1609592424074-245155998f82?w=500",
      "description": "Powerbank kapasitas jumbo 20.000mAh pengisian daya super cepat Power Delivery 65W, sanggup mengisi daya laptop dan smartphone sekaligus.",
      "sizes": ["Midnight Black", "Snow White"]
    },
    {
      "id": 110,
      "name": "True Wireless Earbuds Pro",
      "category": "Audio",
      "price": 179.0,
      "originalPrice": 220.0,
      "rating": 4.8,
      "isFavorite": false,
      "image": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500",
      "description": "TWS earphone dengan peredam kebisingan mikrofon ganda, pemutaran audio spasial 3D, pengisian daya MagSafe, dan daya tahan 6 jam.",
      "sizes": ["White", "Matte Black"]
    }
  ];

  final List<Map<String, dynamic>> _cartItems = [];

  void _addToCart(Map<String, dynamic> product, String selectedSize) {
    int existingIndex = _cartItems.indexWhere((item) =>
        item['id'] == product['id'] && item['selectedSize'] == selectedSize);

    setState(() {
      if (existingIndex != -1) {
        _cartItems[existingIndex]['quantity'] =
            (_cartItems[existingIndex]['quantity'] as int) + 1;
      } else {
        _cartItems.add({
          "id": product['id'],
          "name": product['name'],
          "category": product['category'],
          "price": product['price'],
          "image": product['image'],
          "selectedSize": selectedSize,
          "quantity": 1,
        });
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product['name']} ($selectedSize) masuk keranjang!'),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _updateQuantity(int index, int delta) {
    setState(() {
      int newQty = (_cartItems[index]['quantity'] as int) + delta;
      if (newQty <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index]['quantity'] = newQty;
      }
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            products: _products,
            cartItems: _cartItems,
            onProductTap: (productMap) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(
                    product: productMap,
                    cartItems: _cartItems,
                    onAddToCart: _addToCart,
                    onUpdateQuantity: _updateQuantity,
                    onRemoveFromCart: _removeFromCart,
                    onClearCart: _clearCart,
                  ),
                ),
              );
            },
            onOpenCart: () => setState(() => _currentIndex = 1),
          ),
          CheckoutPaymentScreen(
            cartItems: _cartItems,
            onUpdateQuantity: _updateQuantity,
            onRemoveFromCart: _removeFromCart,
            onClearCart: _clearCart,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_rounded, "Home"),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildNavItem(1, Icons.shopping_bag_outlined, "Shopping"),
                    if (_cartItems.isNotEmpty)
                      Positioned(
                        right: 4,
                        top: 2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2563EB),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${_cartItems.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // WIDGET ITEM NAVIGASI BUBBLE STABIL & HALUS
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2563EB) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 22,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1.0 : 0.0,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}