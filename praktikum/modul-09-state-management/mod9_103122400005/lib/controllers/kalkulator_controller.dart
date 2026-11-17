import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/kalkulator_model.dart';
import '../theme/p3_theme.dart';

class KalkulatorController extends GetxController {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<PerhitunganModel> riwayatList = <PerhitunganModel>[].obs;

  final Rxn<PerhitunganModel> selectedPerhitungan = Rxn<PerhitunganModel>();

  void hitung(String operasi) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final num a1 = num.parse(angka1Controller.text.trim());
    final num a2 = num.parse(angka2Controller.text.trim());

    if ((operasi == '÷' || operasi == '/') && a2 == 0) {
      Get.snackbar(
        'Gagal',
        'Tidak dapat melakukan pembagian dengan nol',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFE53935),
        colorText: Colors.white,
        borderColor: const Color(0xFFFF8A80),
        borderWidth: 1.5,
        icon: const Icon(Icons.error_outline_rounded, color: Colors.white),
        margin: const EdgeInsets.all(16),
        borderRadius: 10,
        duration: const Duration(seconds: 3),
        boxShadows: [
          BoxShadow(
            color: Colors.redAccent.withValues(alpha: 0.4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      );
      return;
    }

    num hasil = 0;
    switch (operasi) {
      case '+':
        hasil = a1 + a2;
        break;
      case '-':
        hasil = a1 - a2;
        break;
      case '×':
      case '*':
        hasil = a1 * a2;
        break;
      case '÷':
      case '/':
        hasil = a1 / a2;
        break;
    }

    final perhitungan = PerhitunganModel(
      angka1: a1,
      angka2: a2,
      operasi: operasi,
      hasil: hasil,
    );

    riwayatList.insert(0, perhitungan);

    Get.snackbar(
      'Berhasil',
      'Perhitungan berhasil dilakukan',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF2E7D32),
      colorText: Colors.white,
      borderColor: const Color(0xFF81C784),
      borderWidth: 1.5,
      icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: Colors.greenAccent.withValues(alpha: 0.3),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  void hapusRiwayat(int index) {
    riwayatList.removeAt(index);

    Get.snackbar(
      'Berhasil',
      'Riwayat berhasil dihapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF0288D1),
      colorText: Colors.white,
      borderColor: P3Theme.cyanElectric,
      borderWidth: 1.5,
      icon: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      boxShadows: P3Theme.neonGlow(blur: 10),
    );
  }

  void hapusSemuaRiwayat() {
    if (riwayatList.isEmpty) {
      Get.snackbar(
        'Info',
        'Belum ada riwayat untuk dihapus',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF091F38),
        colorText: P3Theme.textLight,
        borderColor: P3Theme.cyanElectric.withValues(alpha: 0.6),
        borderWidth: 1.0,
        margin: const EdgeInsets.all(16),
        borderRadius: 10,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    riwayatList.clear();

    Get.snackbar(
      'Berhasil',
      'Seluruh riwayat berhasil dihapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF0288D1),
      colorText: Colors.white,
      borderColor: P3Theme.cyanElectric,
      borderWidth: 1.5,
      icon: const Icon(Icons.delete_sweep_rounded, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      boxShadows: P3Theme.neonGlow(blur: 10),
    );
  }

  @override
  void onClose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.onClose();
  }
}
