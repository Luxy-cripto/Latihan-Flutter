import 'package:flutter/material.dart';
import 'package:latihan_1/routes/app_routes.dart';
import 'receipt_screen.dart';

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
  String _paymentMethod = "CASH";
  final TextEditingController _cashController = TextEditingController();
  double _cashGiven = 0.0;

  double get _subtotal {
    return widget.cartItems.fold(
      0.0,
      (sum, item) => sum + ((item['price'] as double) * (item['quantity'] as int)),
    );
  }

  double get _tax => _subtotal * 0.10;
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
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
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

                        Map<String, dynamic> transactionMap = {
                          "trxId":
                              "TRX-ELK-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}",
                          "dateTime": DateTime.now().toString().substring(0, 16),
                          "items": List<Map<String, dynamic>>.from(widget.cartItems),
                          "subtotal": _subtotal,
                          "tax": _tax,
                          "grandTotal": _grandTotal,
                          "paymentMethod": _paymentMethod,
                          "cashGiven":
                              _paymentMethod == "CASH" ? _cashGiven : _grandTotal,
                          "change": _paymentMethod == "CASH" ? change : 0.0,
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ReceiptScreen(
                              transaction: transactionMap,
                              onFinish: () {
                                widget.onClearCart();
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(AppRoutes.tokoElektronik),
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