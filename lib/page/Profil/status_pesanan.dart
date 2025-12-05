import 'package:flutter/material.dart';

class StatusPesananScreen extends StatefulWidget {
  final String status;
  const StatusPesananScreen({super.key, required this.status});

  @override
  State<StatusPesananScreen> createState() => _StatusPesananScreenState();
}

class _StatusPesananScreenState extends State<StatusPesananScreen> {
  String selectedTab = "Diproses";

  @override
  void initState() {
    super.initState();
    selectedTab = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: const Text(
          "Status Pesanan",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// ========== TAB STATUS ==========
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab("Diproses"),
                const SizedBox(width: 10),
                _buildTab("Dikirim"),
                const SizedBox(width: 10),
                _buildTab("Selesai"),
              ],
            ),

            const SizedBox(height: 20),

            /// ========== LIST PESANAN ==========
            Expanded(
              child: ListView(
                children: [
                  _buildOrderCard(), // nanti bisa di-list data
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 🟩 TAB STATUS ITEM
  Widget _buildTab(String title) {
    bool isActive = selectedTab == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF009F7F) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFF009F7F),
            width: 1.8,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF009F7F),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "lib/assets/status_pesanan.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Paket Lengkap",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Rp 25.000",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF009F7F),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Rp 50.000",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Jumlah produk: 1pcs",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, thickness: 1, color: Colors.black12),

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("1 produk",
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
              Row(
                children: [
                  Text(
                    "Total : ",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Text(
                    "Rp 35.000",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF009F7F),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
