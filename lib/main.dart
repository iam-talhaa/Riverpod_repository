import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pract/TodoApp/homeScreen.dart';

void main() {
  runApp(riverPodPractice());
}

class riverPodPractice extends StatelessWidget {
  const riverPodPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
