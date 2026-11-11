import 'package:flutter/material.dart';

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

    final String trxId = transaction['trxId'] ?? 'TRX-000000';
    final double grandTotal =
        (transaction['grandTotal'] as num?)?.toDouble() ?? 0.0;
    final String dateTime = transaction['dateTime'] ?? '';

    // Data unik transaksi untuk QR Code
    final String qrPayload = "TRX-ELK-$trxId";

    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Struk & Bukti Transaksi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // Card Struk Utama
              Container(
                padding: const EdgeInsets.all(20),
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
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xFFDBEAFE),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF2563EB),
                              size: 42,
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
                            "LUXSTORE ELECTRONICS OFFICIAL",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),

                    _buildReceiptRow("No. Transaksi", trxId),
                    const SizedBox(height: 6),
                    _buildReceiptRow("Waktu", dateTime),
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
                          "\$${grandTotal.toStringAsFixed(2)}",
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
                    const Divider(thickness: 1, height: 1),
                    const SizedBox(height: 16),

                    // SECTION QR CODE OTOMATIS
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "QR Verifikasi Garansi & Digital Invoice",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade300),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: QrCodeWidget(
                              data: qrPayload,
                              size: 150,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Scan QR diatas untuk verifikasi keaslian transaksi",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

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
              const SizedBox(height: 20),

              // TOMBOL KONTROL & AKSI
              ElevatedButton.icon(
                onPressed: () => _showInvoiceModal(context, qrPayload),
                icon: const Icon(Icons.receipt_long_rounded, color: Colors.white),
                label: const Text(
                  "Lihat Invoice Digital",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 10),

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
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

  // DIALOG MODAL INVOICE DIGITAL
  void _showInvoiceModal(BuildContext context, String qrPayload) {
    final List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(transaction['items'] as List);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "INVOICE DIGITAL",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(ctx),
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Luxstore Tech Official",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text("Jl. Katapang No. 88, Bandung",
                                style: TextStyle(fontSize: 11, color: Colors.grey)),
                            Text("CS: support@luxstore.id",
                                style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: QrCodeWidget(
                            data: qrPayload,
                            size: 70,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("No. Invoice:",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Text(transaction['trxId'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tanggal:",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Text(transaction['dateTime'] ?? '',
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Status Pembayaran:",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  "LUNAS",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Rincian Produk",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 8),

                    // Tabel Invoice
                    Table(
                      border: TableBorder.all(color: Colors.grey.shade200),
                      columnWidths: const {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Item",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Qty",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Total",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                        ...items.map((it) {
                          double subItem = (it['price'] as double) *
                              (it['quantity'] as int);
                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(it['name'] ?? '',
                                        style: const TextStyle(fontSize: 12)),
                                    Text("Varian: ${it['selectedSize']}",
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${it['quantity']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("\$${subItem.toStringAsFixed(2)}",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontSize: 12)),
                              ),
                            ],
                          );
                        }).toList()
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal Item"),
                        Text(
                            "\$${(transaction['subtotal'] as double).toStringAsFixed(2)}"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("PPN 10%"),
                        Text(
                            "\$${(transaction['tax'] as double).toStringAsFixed(2)}"),
                      ],
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Pembayaran",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Text(
                          "\$${(transaction['grandTotal'] as double).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SAFE FLUTTER PAINTER QR CODE WIDGET
// ---------------------------------------------------------------------------
class QrCodeWidget extends StatelessWidget {
  final String data;
  final double size;
  final Color color;

  const QrCodeWidget({
    super.key,
    required this.data,
    this.size = 140,
    this.color = const Color(0xFF1E293B),
  });

  @override
  Widget build(BuildContext context) {
    final matrix = _QrEncoder.encode(data);
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _QrPainter(matrix, color: color),
      ),
    );
  }
}

class _QrPainter extends CustomPainter {
  final List<List<bool>> matrix;
  final Color color;

  _QrPainter(this.matrix, {required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (matrix.isEmpty) return;
    final int count = matrix.length;
    final double moduleSize = size.width / count;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int r = 0; r < count; r++) {
      for (int c = 0; c < count; c++) {
        if (matrix[r][c]) {
          canvas.drawRect(
            Rect.fromLTWH(
              c * moduleSize,
              r * moduleSize,
              moduleSize + 0.3,
              moduleSize + 0.3,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _QrPainter oldDelegate) =>
      oldDelegate.matrix != matrix || oldDelegate.color != color;
}

class _QrEncoder {
  static List<List<bool>> encode(String data) {
    final List<int> bytes = data.codeUnits;

    int version = 1;
    if (bytes.length > 14) version = 2;
    if (bytes.length > 26) version = 3;

    final int matrixSize = 17 + (version * 4);
    final List<List<bool>> grid =
        List.generate(matrixSize, (_) => List.filled(matrixSize, false));
    final List<List<bool>> reserved =
        List.generate(matrixSize, (_) => List.filled(matrixSize, false));

    // 1. Finder patterns
    _addFinder(grid, reserved, 0, 0);
    _addFinder(grid, reserved, 0, matrixSize - 7);
    _addFinder(grid, reserved, matrixSize - 7, 0);

    // 2. Alignment pattern
    if (version > 1) {
      int pos = matrixSize - 7;
      _addAlignment(grid, reserved, pos, pos);
    }

    // 3. Timing patterns
    for (int i = 8; i < matrixSize - 8; i++) {
      grid[6][i] = (i % 2 == 0);
      reserved[6][i] = true;
      grid[i][6] = (i % 2 == 0);
      reserved[i][6] = true;
    }

    // Reserve format bits
    for (int i = 0; i < 9; i++) {
      if (i < matrixSize) {
        reserved[8][i] = true;
        reserved[i][8] = true;
      }
      if (matrixSize - 1 - i >= 0) {
        reserved[8][matrixSize - 1 - i] = true;
        reserved[matrixSize - 1 - i][8] = true;
      }
    }

    // 4. Data Bit Stream
    final List<bool> bitList = [];
    bitList.addAll([false, true, false, false]); // Byte mode header
    final int len = bytes.length;
    for (int i = 7; i >= 0; i--) {
      bitList.add(((len >> i) & 1) == 1);
    }
    for (int b in bytes) {
      for (int i = 7; i >= 0; i--) {
        bitList.add(((b >> i) & 1) == 1);
      }
    }

    // Fill data grid safely
    int bitIdx = 0;
    int dir = -1;
    int r = matrixSize - 1;
    int c = matrixSize - 1;

    while (c > 0) {
      if (c == 6) c--;
      for (int i = 0; i < 2; i++) {
        int col = c - i;
        if (r >= 0 && r < matrixSize && col >= 0 && col < matrixSize) {
          if (!reserved[r][col]) {
            bool bit = false;
            if (bitIdx < bitList.length) {
              bit = bitList[bitIdx++];
            } else {
              bit = ((r + col) % 3 == 0);
            }
            if ((r + col) % 2 == 0) bit = !bit;
            grid[r][col] = bit;
          }
        }
      }
      r += dir;
      if (r < 0 || r >= matrixSize) {
        dir = -dir;
        r += dir;
        c -= 2;
      }
    }

    // Format bits safety placement
    const formatBits = [
      true, true, true, false, true, true, true, true,
      true, false, false, false, true, false, false
    ];

    final topCols = [0, 1, 2, 3, 4, 5, 7, 8];
    final leftRows = [8, 7, 5, 4, 3, 2, 1, 0];

    for (int i = 0; i < 8; i++) {
      if (topCols[i] < matrixSize) {
        grid[8][topCols[i]] = formatBits[i];
      }
      if (matrixSize - 1 - i >= 0) {
        grid[matrixSize - 1 - i][8] = formatBits[i];
      }
    }

    for (int i = 0; i < 7; i++) {
      if (matrixSize - 1 - i >= 0) {
        grid[8][matrixSize - 1 - i] = formatBits[8 + i];
      }
      if (leftRows[i] < matrixSize) {
        grid[leftRows[i]][8] = formatBits[8 + i];
      }
    }

    return grid;
  }

  static void _addFinder(
      List<List<bool>> grid, List<List<bool>> reserved, int r, int c) {
    for (int i = -1; i <= 7; i++) {
      for (int j = -1; j <= 7; j++) {
        int row = r + i;
        int col = c + j;
        if (row >= 0 && row < grid.length && col >= 0 && col < grid.length) {
          reserved[row][col] = true;
          if (i >= 0 && i <= 6 && j >= 0 && j <= 6) {
            grid[row][col] = (i == 0 || i == 6 || j == 0 || j == 6) ||
                (i >= 2 && i <= 4 && j >= 2 && j <= 4);
          } else {
            grid[row][col] = false;
          }
        }
      }
    }
  }

  static void _addAlignment(
      List<List<bool>> grid, List<List<bool>> reserved, int r, int c) {
    for (int i = -2; i <= 2; i++) {
      for (int j = -2; j <= 2; j++) {
        int row = r + i;
        int col = c + j;
        if (row >= 0 && row < grid.length && col >= 0 && col < grid.length) {
          if (!reserved[row][col]) {
            reserved[row][col] = true;
            grid[row][col] = (i.abs() == 2 || j.abs() == 2 || (i == 0 && j == 0));
          }
        }
      }
    }
  }
}