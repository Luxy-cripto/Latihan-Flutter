import 'package:flutter/material.dart';

void main() {
  runApp(const ElectronicsStoreApp());
}

class ElectronicsStoreApp extends StatelessWidget {
  const ElectronicsStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronics & Tech Store UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB), // Warna Biru Tech / Elektronik
          primary: const Color(0xFF2563EB),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // ---------------------------------------------------------------------------
  // DATA TANPA MODEL: Murni Menggunakan List & Map<String, dynamic> (10 Produk Elektronik)
  // ---------------------------------------------------------------------------
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

  // List Keranjang (Cart) yang menyimpan Map produk terpilih
  final List<Map<String, dynamic>> _cartItems = [];

  // Helper Tambah Barang ke Keranjang
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // HALAMAN 1: Catalog Home
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
            onOpenCart: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CheckoutPaymentScreen(
                    cartItems: _cartItems,
                    onUpdateQuantity: _updateQuantity,
                    onRemoveFromCart: _removeFromCart,
                    onClearCart: _clearCart,
                  ),
                ),
              );
            },
          ),

          // TAB 2: Direct Cart & Checkout Screen
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
                  children: [
                    _buildNavItem(1, Icons.shopping_bag_outlined, "Shopping"),
                    if (_cartItems.isNotEmpty)
                      Positioned(
                        right: 12,
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

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2563EB) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 22,
            ),
            if (isSelected) const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              )
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// HALAMAN 1: DAFTAR ITEMS (HOME CATALOG SCREEN)
// =============================================================================
class HomeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>) onProductTap;
  final VoidCallback onOpenCart;

  const HomeScreen({
    super.key,
    required this.products,
    required this.cartItems,
    required this.onProductTap,
    required this.onOpenCart,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = "All";
  String _searchQuery = "";

  final List<String> _categories = [
    "All",
    "Smartphones",
    "Laptops",
    "Audio",
    "Wearables",
    "Accessories"
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProducts = widget.products.where((p) {
      bool matchesCategory =
          _selectedCategory == "All" || p['category'] == _selectedCategory;
      bool matchesSearch =
          p['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: const [
                          Text(
                            "Hey, Alex",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF191C1F),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: widget.onOpenCart,
                        icon: const Icon(Icons.shopping_bag_outlined, size: 26),
                      ),
                      if (widget.cartItems.isNotEmpty)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFF2563EB),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${widget.cartItems.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar & Filter Button
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        onChanged: (val) => setState(() => _searchQuery = val),
                        decoration: const InputDecoration(
                          hintText: "Explore Gadgets & Tech",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          icon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2563EB),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.tune, color: Colors.white, size: 20),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Promo Banner Card (Super Sale Mega Gadget 50%)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Mega Gadget\nSale Discount",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Text(
                                "Up to ",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                              Text(
                                "50%",
                                style: TextStyle(
                                  color: Color(0xFF60A5FA),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2563EB),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Shop Now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300',
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey[800], height: 120),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Horizontal Category List Filter
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final isSelected = cat == _selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(
                          cat,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 13,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFF2563EB),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide.none,
                        ),
                        onSelected: (selected) {
                          if (selected) setState(() => _selectedCategory = cat);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Title Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191C1F),
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 14),

              // Product Grid List (Minimal 10 items data)
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  final item = filteredProducts[index];
                  return GestureDetector(
                    onTap: () => widget.onProductTap(item),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(item['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item['isFavorite'] = !(item['isFavorite'] as bool);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        item['isFavorite']
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 16,
                                        color: item['isFavorite']
                                            ? Colors.red
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Elektronik • ${item['category']}",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF191C1F),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      "\$${(item['price'] as double).toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF191C1F),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "\$${(item['originalPrice'] as double).toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HALAMAN 2: DETAIL ITEM & MULTI ITEM PAYMENTS (CASH & QRIS)
// =============================================================================
class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>, String) onAddToCart;
  final Function(int, int) onUpdateQuantity;
  final Function(int) onRemoveFromCart;
  final VoidCallback onClearCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.cartItems,
    required this.onAddToCart,
    required this.onUpdateQuantity,
    required this.onRemoveFromCart,
    required this.onClearCart,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    List<String> sizes = List<String>.from(widget.product['sizes']);
    _selectedSize = sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    List<String> sizes = List<String>.from(widget.product['sizes']);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.product['isFavorite']
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: widget.product['isFavorite'] ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.product['isFavorite'] =
                    !(widget.product['isFavorite'] as bool);
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Main Image Display
                    Center(
                      child: Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(widget.product['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Gallery Thumbnails
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: index == 0
                                  ? const Color(0xFF2563EB)
                                  : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              widget.product['image'],
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF191C1F),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Elektronik • ${widget.product['category']}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\$${(widget.product['price'] as double).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF191C1F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Select Size/Variant Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Pilih Varian / Spesifikasi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Garansi Resmi",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Variant Selection Chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: sizes.map((sz) {
                        bool isSelected = sz == _selectedSize;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedSize = sz),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2563EB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF2563EB)
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              sz,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[800],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Product Description
                    const Text(
                      "Deskripsi Produk",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.product['description'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom Actions (Share + Add To Cart / Pay)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.share_outlined, color: Colors.black),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onAddToCart(widget.product, _selectedSize);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => CheckoutPaymentScreen(
                                cartItems: widget.cartItems,
                                onUpdateQuantity: widget.onUpdateQuantity,
                                onRemoveFromCart: widget.onRemoveFromCart,
                                onClearCart: widget.onClearCart,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: const Text(
                          "Add To Cart & Checkout",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// CHECKOUT & PAYMENT METHOD SCREEN (CASH & QRIS)
// =============================================================================
class CheckoutPaymentScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int, int) onUpdateQuantity;
  final Function(int) onRemoveFromCart;
  final VoidCallback onClearCart;

  const CheckoutPaymentScreen({
    super.key,
    required this.cartItems,
    required this.onUpdateQuantity,
    required this.onRemoveFromCart,
    required this.onClearCart,
  });

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  // Mode Pembayaran: "CASH" atau "QRIS"
  String _paymentMethod = "CASH";

  // Controller untuk Cash Input
  final TextEditingController _cashController = TextEditingController();
  double _cashGiven = 0.0;

  // Hitung Subtotal, PPN (10%), dan Total
  double get _subtotal {
    return widget.cartItems.fold(
      0.0,
      (sum, item) => sum + ((item['price'] as double) * (item['quantity'] as int)),
    );
  }

  double get _tax => _subtotal * 0.10; // PPN 10%
  double get _grandTotal => _subtotal + _tax;

  @override
  Widget build(BuildContext context) {
    double change = _cashGiven - _grandTotal;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cart & Payment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.remove_shopping_cart_outlined,
                      size: 70, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    "Keranjang Belanja Kosong",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SECTION 1: Multi Item Cart List
                  const Text(
                    "Item Pembelian Elektronik",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191C1F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Varian: ${item['selectedSize']} • \$${(item['price'] as double).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Quantity Controller (- Qty +)
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline,
                                      size: 20),
                                  onPressed: () =>
                                      widget.onUpdateQuantity(index, -1),
                                ),
                                Text(
                                  '${item['quantity']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline,
                                      size: 20),
                                  onPressed: () =>
                                      widget.onUpdateQuantity(index, 1),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // SECTION 2: Select Payment Method (CASH vs QRIS)
                  const Text(
                    "Metode Pembayaran",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191C1F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _paymentMethod = "CASH"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: _paymentMethod == "CASH"
                                  ? const Color(0xFF1E293B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _paymentMethod == "CASH"
                                    ? Colors.black
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payments_outlined,
                                  color: _paymentMethod == "CASH"
                                      ? const Color(0xFF60A5FA)
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Tunai (Cash)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _paymentMethod == "CASH"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _paymentMethod = "QRIS"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: _paymentMethod == "QRIS"
                                  ? const Color(0xFF1E293B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _paymentMethod == "QRIS"
                                    ? Colors.black
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.qr_code_2_rounded,
                                  color: _paymentMethod == "QRIS"
                                      ? const Color(0xFF60A5FA)
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "QRIS Instant",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _paymentMethod == "QRIS"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // CASH INPUT SECTION
                  if (_paymentMethod == "CASH") ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Input Nominal Uang Tunai (\$):",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _cashController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Contoh: 1500.0",
                              prefixIcon: const Icon(Icons.attach_money),
                              filled: true,
                              fillColor: const Color(0xFFF5F6F8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _cashGiven = double.tryParse(val) ?? 0.0;
                              });
                            },
                          ),
                          const SizedBox(height: 12),

                          // Quick Cash Nominal Chips (Sesuai kisaran harga elektronik)
                          Wrap(
                            spacing: 8,
                            children: [100, 500, 1000, 2000].map((amt) {
                              return ActionChip(
                                label: Text("\$$amt"),
                                backgroundColor: const Color(0xFFF5F6F8),
                                onPressed: () {
                                  setState(() {
                                    _cashGiven = amt.toDouble();
                                    _cashController.text = amt.toString();
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Kembalian:"),
                              Text(
                                change >= 0
                                    ? "\$${change.toStringAsFixed(2)}"
                                    : "Uang Belum Cukup!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: change >= 0 ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],

                  // QRIS PAYMENT DISPLAY SECTION
                  if (_paymentMethod == "QRIS") ...[
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.qr_code_scanner, color: Colors.redAccent),
                              SizedBox(width: 8),
                              Text(
                                "QRIS Standar Pembayaran Nasional",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.qr_code_2,
                              size: 160,
                              color: Color(0xFF191C1F),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Scan QR diatas menggunakan BCA, GoPay, OVO, ShopeePay",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                  const SizedBox(height: 20),

                  // PRICE SUMMARY BREAKDOWN
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Subtotal Item",
                                style: TextStyle(color: Colors.grey)),
                            Text("\$${_subtotal.toStringAsFixed(2)}"),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("PPN (10%)",
                                style: TextStyle(color: Colors.grey)),
                            Text("\$${_tax.toStringAsFixed(2)}"),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Bayar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$${_grandTotal.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Color(0xFF191C1F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // SUBMIT PAYMENT BUTTON -> NAVIGATES TO SCREEN 3 (STRUK)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validasi Pembayaran Cash
                        if (_paymentMethod == "CASH" && _cashGiven < _grandTotal) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Nominal uang tunai kurang dari total pembayaran!",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        // Buat Data Map Transaksi
                        Map<String, dynamic> transactionMap = {
                          "trxId": "TRX-ELK-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}",
                          "dateTime": DateTime.now().toString().substring(0, 16),
                          "items": List<Map<String, dynamic>>.from(widget.cartItems),
                          "subtotal": _subtotal,
                          "tax": _tax,
                          "grandTotal": _grandTotal,
                          "paymentMethod": _paymentMethod,
                          "cashGiven": _paymentMethod == "CASH" ? _cashGiven : _grandTotal,
                          "change": _paymentMethod == "CASH" ? change : 0.0,
                        };

                        // Pindah ke Halaman 3 (Struk Pembayaran)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ReceiptScreen(
                              transaction: transactionMap,
                              onFinish: () {
                                widget.onClearCart();
                                Navigator.popUntil(
                                  context,
                                  (route) => route.isFirst,
                                );
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Text(
                        "Konfirmasi & Bayar \$${_grandTotal.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}

// =============================================================================
// HALAMAN 3: STRUK PEMBAYARAN (RECEIPT / INVOICE SCREEN)
// =============================================================================
class ReceiptScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final VoidCallback onFinish;

  const ReceiptScreen({
    super.key,
    required this.transaction,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(transaction['items'] as List);

    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Struk Pembayaran",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              // Receipt Container Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Success Check Icon Header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              color: Color(0xFFDBEAFE),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF2563EB),
                              size: 46,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Pembayaran Berhasil!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "TECH & ELECTRONICS STORE OFFICIAL #088",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),

                    // Metadata Transaksi
                    _buildReceiptRow("No. Transaksi", transaction['trxId']),
                    const SizedBox(height: 6),
                    _buildReceiptRow("Waktu", transaction['dateTime']),
                    const SizedBox(height: 6),
                    _buildReceiptRow(
                      "Metode Bayar",
                      transaction['paymentMethod'] == "CASH"
                          ? "Tunai (Cash)"
                          : "QRIS Dynamic",
                    ),
                    const SizedBox(height: 16),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),

                    // Itemized Rincian Barang Elektronik
                    const Text(
                      "Rincian Barang:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...items.map((item) {
                      double totalItem =
                          (item['price'] as double) * (item['quantity'] as int);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${item['name']} [${item['selectedSize']}] x${item['quantity']}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            Text(
                              "\$${totalItem.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 12),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),

                    // Ringkasan Biaya
                    _buildReceiptRow(
                      "Subtotal",
                      "\$${(transaction['subtotal'] as double).toStringAsFixed(2)}",
                    ),
                    const SizedBox(height: 6),
                    _buildReceiptRow(
                      "PPN (10%)",
                      "\$${(transaction['tax'] as double).toStringAsFixed(2)}",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Akhir",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${(transaction['grandTotal'] as double).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF191C1F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),

                    // Bayar & Kembalian
                    _buildReceiptRow(
                      "Nominal Bayar",
                      "\$${(transaction['cashGiven'] as double).toStringAsFixed(2)}",
                    ),
                    const SizedBox(height: 6),
                    _buildReceiptRow(
                      "Kembalian",
                      "\$${(transaction['change'] as double).toStringAsFixed(2)}",
                      isHighlight: true,
                    ),
                    const SizedBox(height: 20),

                    // Footer note
                    const Center(
                      child: Text(
                        "~ Terima Kasih Telah Berbelanja Produk Elektronik ~",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Struk transaksi berhasil disimpan!"),
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                icon: const Icon(Icons.download_rounded, color: Colors.black),
                label: const Text(
                  "Cetak / Simpan Struk",
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onFinish,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Kembali ke Beranda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String title, String value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: isHighlight ? Colors.black : Colors.grey[700],
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.w500,
            color: isHighlight ? const Color(0xFF2563EB) : Colors.black,
          ),
        ),
      ],
    );
  }
}