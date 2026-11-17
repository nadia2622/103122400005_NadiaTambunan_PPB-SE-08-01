import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/penjumlahan_model.dart';

class PenjumlahanController extends GetxController {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rxn<Penjumlahan> hasilPenjumlahan = Rxn<Penjumlahan>();
  final RxInt jumlahPerhitungan = 0.obs;

  String formatAngka(num n) {
    return n % 1 == 0 ? n.toInt().toString() : n.toString();
  }

  void hitung() {
    if (formKey.currentState!.validate()) {
      final num a1 = num.parse(angka1Controller.text.trim());
      final num a2 = num.parse(angka2Controller.text.trim());
      final num total = a1 + a2;

      hasilPenjumlahan.value = Penjumlahan(
        angka1: a1,
        angka2: a2,
        hasil: total,
      );

      jumlahPerhitungan.value++;

      Get.snackbar(
        'Berhasil',
        'Proses penjumlahan berhasil dilakukan (${formatAngka(a1)} + ${formatAngka(a2)} = ${formatAngka(total)})',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xE60A192F),
        colorText: const Color(0xFFE2F1FF),
        borderColor: const Color(0xFF00D2FF),
        borderWidth: 1.5,
        icon: const Icon(Icons.check_circle_rounded, color: Color(0xFF00D2FF)),
        margin: const EdgeInsets.all(16),
        borderRadius: 10,
        duration: const Duration(seconds: 3),
        boxShadows: [
          BoxShadow(
            color: const Color(0xFF00D2FF).withValues(alpha: 0.3),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      );
    }
  }

  @override
  void onClose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.onClose();
  }
}
