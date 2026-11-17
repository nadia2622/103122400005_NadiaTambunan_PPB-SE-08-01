import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kalkulator_controller.dart';
import '../models/kalkulator_model.dart';
import '../theme/p3_theme.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // 2c. Dependency Injection: Akses controller menggunakan Get.find()
    final KalkulatorController controller = Get.find<KalkulatorController>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: P3BackgroundWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header & Back Button bergaya Persona 3
              _buildAppBar(),
              const SizedBox(height: 32),

              // 1c. Tampilkan detail data yang dipilih menggunakan Obx()
              Expanded(
                child: Obx(() {
                  final data = controller.selectedPerhitungan.value;
                  if (data == null) {
                    return _buildEmptyState();
                  }
                  return _buildDetailContent(data);
                }),
              ),

              // 2d. Tombol Kembali menggunakan Get.back()
              _buildBackButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      // FAB di sudut kiri bawah
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _buildMenuFab(context),
    );
  }

  // AppBar dengan navigasi Get.back()
  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
          // 2d. Tombol Back menggunakan Get.back()
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: P3Theme.blueDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: P3Theme.cyanElectric),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: P3Theme.cyanElectric,
                size: 22,
              ),
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
                      'DETAIL PERHITUNGAN',
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
                  'Detail Operasi',
                  style: TextStyle(
                    color: P3Theme.textLight,
                    fontSize: 20,
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

  // Tampilan jika data tidak tersedia
  Widget _buildEmptyState() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        decoration: BoxDecoration(
          color: P3Theme.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: P3Theme.cardBorder, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hourglass_empty_rounded,
              size: 48,
              color: P3Theme.textMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum ada data',
              style: TextStyle(
                color: P3Theme.textMuted,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1c. Tampilan Detail: Angka Pertama, Jenis Operasi, Angka Kedua, Hasil, dan Keterangan
  Widget _buildDetailContent(PerhitunganModel data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: P3Theme.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: P3Theme.cyanElectric.withValues(alpha: 0.6),
                width: 1.5,
              ),
              boxShadow: [
                ...P3Theme.neonGlow(blur: 14),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Angka Pertama
                _buildDataRow(
                  tag: '01',
                  label: 'Angka Pertama',
                  value: PerhitunganModel.formatAngka(data.angka1),
                ),
                const SizedBox(height: 16),

                // Jenis Operasi
                _buildDataRow(
                  tag: 'OP',
                  label: 'Jenis Operasi',
                  value: '${data.namaOperasi.capitalizeFirst} (${data.operasi})',
                ),
                const SizedBox(height: 16),

                // Angka Kedua
                _buildDataRow(
                  tag: '02',
                  label: 'Angka Kedua',
                  value: PerhitunganModel.formatAngka(data.angka2),
                ),
                const SizedBox(height: 20),

                // Divider bercahaya khas Persona 3
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        P3Theme.cyanElectric,
                        P3Theme.bluePrimary,
                        Colors.transparent,
                      ],
                    ),
                    boxShadow: P3Theme.neonGlow(blur: 6),
                  ),
                ),
                const SizedBox(height: 20),

                // Hasil Perhitungan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hasil Perhitungan :',
                      style: TextStyle(
                        color: P3Theme.cyanElectric,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: P3Theme.blueDark,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: P3Theme.cyanElectric),
                        boxShadow: P3Theme.neonGlow(blur: 8),
                      ),
                      child: Text(
                        PerhitunganModel.formatAngka(data.hasil),
                        style: const TextStyle(
                          color: P3Theme.cyanElectric,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 1c. Keterangan sesuai operasi yang dipilih (misal: "Hasil penjumlahan antara 3 dan 3 adalah 6")
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF071C35),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: P3Theme.cardBorder,
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: P3Theme.cyanElectric,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KETERANGAN OPERASI',
                        style: TextStyle(
                          color: P3Theme.cyanElectric,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data.keterangan,
                        style: const TextStyle(
                          color: P3Theme.textLight,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Row item informasi data
  Widget _buildDataRow({required String tag, required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: P3Theme.blueDark,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: P3Theme.cyanElectric.withValues(alpha: 0.5),
                ),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: P3Theme.cyanElectric,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '$label :',
              style: const TextStyle(
                color: P3Theme.textLight,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            color: P3Theme.textLight,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // 2d. Tombol Kembali menggunakan Get.back()
  Widget _buildBackButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF071B33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: P3Theme.cyanElectric.withValues(alpha: 0.8),
          width: 1.5,
        ),
        boxShadow: P3Theme.neonGlow(blur: 10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // 2d. Navigasi kembali ke Home menggunakan Get.back()
            Get.back();
          },
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_rounded, color: P3Theme.cyanElectric, size: 20),
                SizedBox(width: 8),
                Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: P3Theme.cyanElectric,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // FAB di pojok kiri bawah (konsisten)
  Widget _buildMenuFab(BuildContext context) {
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
          Get.snackbar(
            'S.E.E.S. Protocol',
            'Detail Mode: Perhitungan Terpilih',
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color(0xE60A192F),
            colorText: const Color(0xFFE2F1FF),
            borderColor: const Color(0xFF00D2FF),
            borderWidth: 1.5,
            icon: const Icon(Icons.info_outline, color: Color(0xFF00D2FF)),
            margin: const EdgeInsets.all(16),
            borderRadius: 10,
            duration: const Duration(seconds: 2),
          );
        },
      ),
    );
  }
}
