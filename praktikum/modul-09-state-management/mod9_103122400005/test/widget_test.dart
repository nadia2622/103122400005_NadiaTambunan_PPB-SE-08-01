import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mod9_103122400005/main.dart';
import 'package:mod9_103122400005/models/kalkulator_model.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.reset();
  });

  tearDown(() {
    Get.reset();
  });

  group('Model PerhitunganModel Test', () {
    test('Format dan keterangan operasi penjumlahan', () {
      final model = PerhitunganModel(angka1: 3, angka2: 3, operasi: '+', hasil: 6);
      expect(model.formatRiwayat, '3 + 3 = 6');
      expect(model.keterangan, 'Hasil penjumlahan antara 3 dan 3 adalah 6');
    });

    test('Format dan keterangan operasi pengurangan', () {
      final model = PerhitunganModel(angka1: 5, angka2: 2, operasi: '-', hasil: 3);
      expect(model.formatRiwayat, '5 - 2 = 3');
      expect(model.keterangan, 'Hasil pengurangan antara 5 dan 2 adalah 3');
    });

    test('Format dan keterangan operasi perkalian', () {
      final model = PerhitunganModel(angka1: 4, angka2: 5, operasi: '×', hasil: 20);
      expect(model.formatRiwayat, '4 × 5 = 20');
      expect(model.keterangan, 'Hasil perkalian antara 4 dan 5 adalah 20');
    });

    test('Format dan keterangan operasi pembagian', () {
      final model = PerhitunganModel(angka1: 10, angka2: 2, operasi: '÷', hasil: 5);
      expect(model.formatRiwayat, '10 ÷ 2 = 5');
      expect(model.keterangan, 'Hasil pembagian antara 10 dan 2 adalah 5');
    });
  });

  group('Widget & Controller Test', () {
    testWidgets('Tampilan awal: Form dan Riwayat kosong', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Kalkulator'), findsOneWidget);
      expect(find.text('Riwayat Perhitungan'), findsOneWidget);
      expect(find.text('Belum ada data'), findsOneWidget);
      expect(find.text('+'), findsOneWidget);
      expect(find.text('-'), findsOneWidget);
      expect(find.text('×'), findsOneWidget);
      expect(find.text('÷'), findsOneWidget);
    });

    testWidgets('Validasi form: input kosong memunculkan pesan wajib diisi', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();

      expect(find.text('Angka pertama wajib diisi'), findsOneWidget);
      expect(find.text('Angka kedua wajib diisi'), findsOneWidget);
    });

    testWidgets('Operasi penjumlahan berhasil dan masuk riwayat', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), '1');
      await tester.enterText(textFields.at(1), '2');
      await tester.pumpAndSettle();

      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 4));

      expect(find.text('1 + 2 = 3'), findsOneWidget);
    });

    testWidgets('Validasi pembagian dengan angka nol memunculkan snackbar error', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), '10');
      await tester.enterText(textFields.at(1), '0');
      await tester.pumpAndSettle();

      await tester.tap(find.text('÷'));
      await tester.pump();
      expect(find.text('Tidak dapat melakukan pembagian dengan nol'), findsOneWidget);

      await tester.pump(const Duration(seconds: 4));
    });

    testWidgets('Navigasi ke DetailView via tap item riwayat dan cek keterangan', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), '3');
      await tester.enterText(textFields.at(1), '3');
      await tester.pumpAndSettle();

      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 4));

      // Tap item riwayat
      await tester.tap(find.text('3 + 3 = 6'));
      await tester.pumpAndSettle();

      // Pastikan berada di halaman detail dan keterangan tampil
      expect(find.text('Detail Operasi'), findsOneWidget);
      expect(find.text('Hasil penjumlahan antara 3 dan 3 adalah 6'), findsOneWidget);

      // Tap tombol kembali
      await tester.tap(find.text('KEMBALI'));
      await tester.pumpAndSettle();

      expect(find.text('Kalkulator'), findsOneWidget);
    });

    testWidgets('Hapus riwayat per item dan hapus seluruh riwayat', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), '5');
      await tester.enterText(textFields.at(1), '2');
      await tester.pumpAndSettle();

      await tester.tap(find.text('-'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 4));

      expect(find.text('5 - 2 = 3'), findsOneWidget);

      // Hapus seluruh riwayat via icon delete sweep di header riwayat
      await tester.tap(find.byIcon(Icons.delete_sweep_rounded));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 4));

      expect(find.text('Belum ada data'), findsOneWidget);
    });
  });
}
