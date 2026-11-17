import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get supabaseUrl {
    final val = dotenv.env['SUPABASE_URL'] ?? dotenv.env['NEXT_PUBLIC_SUPABASE_URL'];
    if (val != null && val.isNotEmpty) return val;
    return 'https://zpmopzxeryvntubplnww.supabase.co';
  }

  static String get supabaseAnonKey {
    final val = dotenv.env['SUPABASE_ANON_KEY'] ??
        dotenv.env['NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY'];
    if (val != null && val.isNotEmpty) return val;
    return 'sb_publishable_pMAUpgJGjm47fNAGhr1wzg_UACeiutu';
  }

  static String get todosTable =>
      dotenv.env['SUPABASE_TODOS_TABLE'] ?? 'todos';
}
