import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kalkulator_controller.dart';
import '../models/kalkulator_model.dart';
import '../theme/p3_theme.dart';
import 'detail_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // 2c. Dependency Injection: Daftarkan controller menggunakan Get.put()
    final KalkulatorController controller = Get.put(KalkulatorController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: P3BackgroundWrapper(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bergaya Persona 3
              _buildHeader(),
              const SizedBox(height: 24),

              // Form Dua TextFormField beserta validasi
              _buildFormSection(controller),
              const SizedBox(height: 20),

              // 1a. Pilihan operasi penjumlahan (+), pengurangan (-), perkalian (×), pembagian (÷)
              _buildOperationButtons(controller),
              const SizedBox(height: 28),

              // 1b & 1e. Riwayat Perhitungan & tombol hapus seluruh riwayat
              _buildHistorySection(controller),
            ],
          ),
        ),
      ),
      // FAB di sudut kiri bawah sesuai screenshot referensi
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _buildMenuFab(context, controller),
    );
  }

  // Header bernuansa Persona 3
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: P3Theme.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: P3Theme.cyanElectric.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: P3Theme.neonGlow(blur: 8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: P3Theme.blueDark,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: P3Theme.cyanElectric),
            ),
            child: const Icon(
              Icons.calculate_rounded,
              color: P3Theme.cyanElectric,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: P3Theme.cyanElectric,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'P3 // S.E.E.S.',
                        style: TextStyle(
                          color: Color(0xFF03070F),
                          fontWeight: FontWeight.w900,
                          fontSize: 10,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'TARTARUS CALC',
                      style: TextStyle(
                        color: P3Theme.textMuted.withValues(alpha: 0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kalkulator',
                  style: TextStyle(
                    color: P3Theme.textLight,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Form Input Angka Pertama dan Kedua
  Widget _buildFormSection(KalkulatorController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: P3Theme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: P3Theme.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Angka Pertama
            TextFormField(
              controller: controller.angka1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              style: const TextStyle(
                color: P3Theme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: P3Theme.cyanElectric,
              decoration: _inputDecoration(
                labelText: 'Angka Pertama',
                hintText: 'Angka Pertama',
                prefixIcon: Icons.looks_one_outlined,
              ),
              // 1a. Validasi angka pertama wajib diisi
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Angka pertama wajib diisi';
                }
                if (num.tryParse(value.trim()) == null) {
                  return 'Format angka tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 18),

            // Angka Kedua
            TextFormField(
              controller: controller.angka2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              style: const TextStyle(
                color: P3Theme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: P3Theme.cyanElectric,
              decoration: _inputDecoration(
                labelText: 'Angka Kedua',
                hintText: 'Angka Kedua',
                prefixIcon: Icons.looks_two_outlined,
              ),
              // 1a. Validasi angka kedua wajib diisi
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Angka kedua wajib diisi';
                }
                if (num.tryParse(value.trim()) == null) {
                  return 'Format angka tidak valid';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  // Input decoration khas Persona 3
  InputDecoration _inputDecoration({
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: P3Theme.textMuted,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: P3Theme.textMuted.withValues(alpha: 0.5),
        fontSize: 15,
      ),
      filled: true,
      fillColor: const Color(0xFF071221),
      prefixIcon: Icon(prefixIcon, color: P3Theme.cyanElectric, size: 22),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: P3Theme.cardBorder, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: P3Theme.cyanElectric, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF5252), width: 2),
      ),
      errorStyle: const TextStyle(
        color: Color(0xFFFF5252),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // 1a. Baris 4 Tombol Operasi: (+), (-), (×), (÷)
  Widget _buildOperationButtons(KalkulatorController controller) {
    const operations = [
      {'label': '+', 'op': '+'},
      {'label': '-', 'op': '-'},
      {'label': '×', 'op': '×'},
      {'label': '÷', 'op': '÷'},
    ];

    return Row(
      children: operations.map((item) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF092544),
                    Color(0xFF0E3866),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: P3Theme.cyanElectric.withValues(alpha: 0.7),
                  width: 1.5,
                ),
                boxShadow: P3Theme.neonGlow(blur: 8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.hitung(item['op']!);
                  },
                  child: Center(
                    child: Text(
                      item['label']!,
                      style: const TextStyle(
                        color: P3Theme.cyanElectric,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // 1b & 2b. Section Riwayat Perhitungan (Reactive dengan Obx)
  Widget _buildHistorySection(KalkulatorController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: P3Theme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: P3Theme.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Riwayat + Tombol Hapus Seluruh Riwayat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: P3Theme.blueDark,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.history_rounded,
                      color: P3Theme.cyanElectric,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Riwayat Perhitungan',
                    style: TextStyle(
                      color: P3Theme.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              // 1e & 2e. Tombol hapus seluruh riwayat
              IconButton(
                tooltip: 'Hapus Seluruh Riwayat',
                icon: const Icon(
                  Icons.delete_sweep_rounded,
                  color: Color(0xFFFF5252),
                  size: 24,
                ),
                onPressed: () {
                  controller.hapusSemuaRiwayat();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Daftar Riwayat (Obx)
          Obx(() {
            if (controller.riwayatList.isEmpty) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(
                      Icons.hourglass_empty_rounded,
                      color: P3Theme.textMuted.withValues(alpha: 0.5),
                      size: 36,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Belum ada data',
                      style: TextStyle(
                        color: P3Theme.textMuted,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.riwayatList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = controller.riwayatList[index];
                return _buildHistoryItem(context, controller, item, index);
              },
            );
          }),
        ],
      ),
    );
  }

  // 1c. Setiap item riwayat dapat ditekan untuk ke DetailView + tombol hapus per item
  Widget _buildHistoryItem(
    BuildContext context,
    KalkulatorController controller,
    PerhitunganModel item,
    int index,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF081A30),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: P3Theme.cardBorder,
          width: 1.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // 1c & 2d. Simpan data terpilih lalu navigasi ke DetailView dengan Get.to()
            controller.selectedPerhitungan.value = item;
            Get.to(() => const DetailView());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: P3Theme.blueDark,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: P3Theme.cyanElectric.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Text(
                          item.operasi,
                          style: const TextStyle(
                            color: P3Theme.cyanElectric,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.formatRiwayat,
                          style: const TextStyle(
                            color: P3Theme.textLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 1e & 2e. Tombol hapus salah satu riwayat
                IconButton(
                  tooltip: 'Hapus Riwayat Ini',
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: P3Theme.textMuted,
                    size: 20,
                  ),
                  onPressed: () {
                    controller.hapusRiwayat(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Floating Action Button di pojok kiri bawah (sesuai referensi UI)
  Widget _buildMenuFab(BuildContext context, KalkulatorController controller) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: P3Theme.cyanElectric, width: 1.5),
        boxShadow: P3Theme.neonGlow(blur: 10),
      ),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFF091E36),
        child: const Icon(Icons.menu, color: P3Theme.cyanElectric),
        onPressed: () {
          Get.bottomSheet(
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF061324),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(color: P3Theme.cyanElectric, width: 2),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: P3Theme.blueDark,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.info_outline, color: P3Theme.cyanElectric, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'PERSONA 3 // SYSTEM MENU',
                        style: TextStyle(
                          color: P3Theme.textLight,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Operasi: Penjumlahan (+), Pengurangan (-), Perkalian (×), Pembagian (÷)\n'
                    'Fitur: Riwayat Tersimpan, Detail Item, Validasi Nol, Hapus Riwayat.',
                    style: TextStyle(
                      color: P3Theme.textMuted,
                      height: 1.5,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2645),
                        foregroundColor: P3Theme.cyanElectric,
                        side: const BorderSide(color: P3Theme.cyanElectric),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        controller.angka1Controller.clear();
                        controller.angka2Controller.clear();
                        Get.back();
                      },
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('BERSIHKAN INPUT FORM'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
