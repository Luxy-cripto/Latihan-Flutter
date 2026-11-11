import 'package:flutter/material.dart';
import 'receipt_screen.dart';

class DetailCheckoutScreen extends StatefulWidget {
  final Map<String, dynamic> selectedProduct;
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>, String) onAddToCart;
  final VoidCallback onClearCart;

  const DetailCheckoutScreen({
    super.key,
    required this.selectedProduct,
    required this.cartItems,
    required this.onAddToCart,
    required this.onClearCart,
  });

  @override
  State<DetailCheckoutScreen> createState() => _DetailCheckoutScreenState();
}

class _DetailCheckoutScreenState extends State<DetailCheckoutScreen> {
  late String _currentSize;
  String _paymentMethod = 'CASH';
  final TextEditingController _cashInputController = TextEditingController();
  double _cashGiven = 0.0;

  @override
  void initState() {
    super.initState();
    _currentSize = widget.selectedProduct['selectedSize'] ?? 'L';
  }

  double get _subtotal => widget.cartItems.fold(0.0, (sum, item) => sum + ((item['price'] as double) * (item['qty'] as int)));
  double get _tax => _subtotal * 0.10;
  double get _grandTotal => _subtotal + _tax;
  double get _change => _cashGiven >= _grandTotal ? _cashGiven - _grandTotal : 0.0;

  @override
  Widget build(BuildContext context) {
    final prod = widget.selectedProduct;
    final sizes = prod['sizes'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details & Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(prod['isFavorite'] == true ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: () {
              setState(() {
                prod['isFavorite'] = !(prod['isFavorite'] as bool);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(prod['image'], height: 220, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(prod['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Text('\$${prod['price'].toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF16A34A))),
              ],
            ),
            Text(prod['category'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 12),
            const Text('Select Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: sizes.map((size) {
                final isSelected = _currentSize == size;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentSize = size.toString();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF4ADE80) : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: isSelected ? const Color(0xFF22C55E) : Colors.transparent),
                    ),
                    child: Text(
                      size.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.black : Colors.grey.shade700),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text(prod['description'], style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 42),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                widget.onAddToCart(prod, _currentSize);
                setState(() {});
              },
              icon: const Icon(Icons.add_shopping_cart, size: 18),
              label: const Text('Add This Item To Cart'),
            ),
            const Divider(height: 32, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Summary (${widget.cartItems.length} items)', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                  onPressed: () {
                    widget.onClearCart();
                    setState(() {});
                  },
                )
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
                  child: Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(item['image'], width: 45, height: 45, fit: BoxFit.cover)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            Text('Size: ${item['size']} | \$${item['price']}', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, size: 18),
                            onPressed: () {
                              setState(() {
                                if (item['qty'] > 1) {
                                  item['qty']--;
                                } else {
                                  widget.cartItems.removeAt(index);
                                }
                              });
                            },
                          ),
                          Text('${item['qty']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, size: 18),
                            onPressed: () {
                              setState(() {
                                item['qty']++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  _buildCostRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
                  const SizedBox(height: 4),
                  _buildCostRow('Tax / PPN (10%)', '\$${_tax.toStringAsFixed(2)}'),
                  const Divider(height: 12),
                  _buildCostRow('Grand Total', '\$${_grandTotal.toStringAsFixed(2)}', isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    avatar: const Icon(Icons.money, size: 18),
                    label: const Center(child: Text('Cash / Tunai')),
                    selected: _paymentMethod == 'CASH',
                    selectedColor: const Color(0xFF4ADE80),
                    onSelected: (val) {
                      setState(() {
                        _paymentMethod = 'CASH';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ChoiceChip(
                    avatar: const Icon(Icons.qr_code_2, size: 18),
                    label: const Center(child: Text('QRIS Instant')),
                    selected: _paymentMethod == 'QRIS',
                    selectedColor: const Color(0xFF4ADE80),
                    onSelected: (val) {
                      setState(() {
                        _paymentMethod = 'QRIS';
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_paymentMethod == 'CASH') ...[
              TextField(
                controller: _cashInputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nominal Uang Bayar (\$)',
                  prefixText: '\$ ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _cashInputController.clear();
                      setState(() {
                        _cashGiven = 0.0;
                      });
                    },
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    _cashGiven = double.tryParse(val) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [50, 100, 150, 200].map((amount) {
                  return ActionChip(
                    label: Text('\$$amount'),
                    onPressed: () {
                      setState(() {
                        _cashGiven = amount.toDouble();
                        _cashInputController.text = amount.toString();
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _cashGiven >= _grandTotal ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Kembalian:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '\$${_change.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: _cashGiven >= _grandTotal ? Colors.green.shade800 : Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    const Icon(Icons.qr_code_scanner, size: 100, color: Colors.black87),
                    const SizedBox(height: 8),
                    const Text('Scan QRIS untuk Membayar', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('NMID: ID10293847561 • LUXSTORE', style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                    const SizedBox(height: 4),
                    const Text('Status: Menunggu Pembayaran...', style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4ADE80),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                if (widget.cartItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Keranjang kosong!')));
                  return;
                }

                if (_paymentMethod == 'CASH' && _cashGiven < _grandTotal) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Uang pembayaran kurang!'), backgroundColor: Colors.red),
                  );
                  return;
                }

                final Map<String, dynamic> transactionData = {
                  'transactionId': 'TRX-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
                  'dateTime': DateTime.now().toString().substring(0, 16),
                  'items': List<dynamic>.from(widget.cartItems),
                  'subtotal': _subtotal,
                  'tax': _tax,
                  'grandTotal': _grandTotal,
                  'paymentMethod': _paymentMethod,
                  'cashGiven': _paymentMethod == 'CASH' ? _cashGiven : _grandTotal,
                  'change': _paymentMethod == 'CASH' ? _change : 0.0,
                };

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiptScreen(transaction: transactionData),
                  ),
                );
              },
              child: const Text('CONFIRM PAYMENT & PRINT RECEIPT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCostRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: isBold ? 14 : 13)),
        Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: isBold ? 14 : 13)),
      ],
    );
  }
}

class ReceiptScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const ReceiptScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receipt')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transaction: ${transaction['transactionId']}'),
            Text('Date: ${transaction['dateTime']}'),
            const Divider(),
            ...(transaction['items'] as List<dynamic>).map((item) => Text(
                  '${item['name']} x${item['qty']} — \$${(item['price'] * item['qty']).toStringAsFixed(2)}',
                )),
            const Divider(),
            Text('Subtotal: \$${(transaction['subtotal'] as num).toStringAsFixed(2)}'),
            Text('Tax: \$${(transaction['tax'] as num).toStringAsFixed(2)}'),
            Text('Total: \$${(transaction['grandTotal'] as num).toStringAsFixed(2)}'),
            Text('Payment: ${transaction['paymentMethod']}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('DONE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}