import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  await Supabase.initialize(
    url: "https://mnqlzijziaeqlmbreudg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ucWx6aWp6aWFlcWxtYnJldWRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1MTAzOTIsImV4cCI6MjA1NDA4NjM5Mn0.fCgCD0UsMw7wszDrywRfQGvFn97iBql4o2moPbdFIY8",
  );
  runApp(const App());
}
