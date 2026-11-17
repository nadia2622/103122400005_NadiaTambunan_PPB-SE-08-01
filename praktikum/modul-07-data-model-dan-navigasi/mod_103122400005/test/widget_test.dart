import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mod_103122400005/main.dart';

void main() {
  testWidgets('App renders comic list correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Daftar Komik'), findsOneWidget);
    expect(find.text('Boku no Hero Academia'), findsOneWidget);
    expect(find.text('Jujutsu Kaisen'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Tap comic navigates to detail page and back', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Boku no Hero Academia'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('KEMBALI'), findsOneWidget);
    expect(
      find.text('Boku no Hero Academia adalah manga karya Kohei Horikoshi.'),
      findsOneWidget,
    );

    await tester.tap(find.text('KEMBALI'));
    await tester.pumpAndSettle();

    expect(find.text('Daftar Komik'), findsOneWidget);
  });

  testWidgets('Long press comic navigates to edit page and updates', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.longPress(find.text('Jujutsu Kaisen'));
    await tester.pumpAndSettle();

    expect(find.text('Edit Komik'), findsOneWidget);
    expect(find.text('Perbaharui'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextField, 'Jujutsu Kaisen'),
      'Jujutsu Kaisen S2',
    );
    await tester.tap(find.text('Perbaharui'));
    await tester.pumpAndSettle();

    expect(find.text('Daftar Komik'), findsOneWidget);
    expect(find.text('Jujutsu Kaisen S2'), findsOneWidget);
  });

  testWidgets('FAB shows add dialog and adds comic', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Komik Baru'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), 'One Piece');
    await tester.enterText(
      textFields.at(1),
      'Petualangan Luffy mencari harta karun One Piece',
    );

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('One Piece'), findsOneWidget);
  });

  testWidgets('Double tap deletes comic and shows snackbar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Boku no Hero Academia'), findsOneWidget);

    await tester.tap(find.text('Boku no Hero Academia'));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(find.text('Boku no Hero Academia'));
    await tester.pumpAndSettle();

    expect(find.text('Boku no Hero Academia'), findsNothing);
    expect(
      find.text("Data 'Boku no Hero Academia' sudah dihapus"),
      findsOneWidget,
    );
  });
}
