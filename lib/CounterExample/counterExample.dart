import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final countProvider = StateProvider<int>((ref) {
  return 0;
});

final SwitchProvider = StateProvider<bool>((ref) {
  return false;
});

class CounterExample extends ConsumerWidget {
  const CounterExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Print 1");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(countProvider);
                return Text(
                  counter.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              print("Print 2");
              ref.read(countProvider.notifier).state++;
            },
            child: const Text("+"),
          ),
          ElevatedButton(
            onPressed: () {
              print("Print 3");
              ref.read(countProvider.notifier).state--;
            },
            child: const Text("-"),
          ),
          Consumer(
            builder: (context, ref, child) {
              final switchValue = ref.watch(SwitchProvider);
              return Switch(
                onChanged: (value) {
                  print("Print 4");
                  final notifier = ref.read(SwitchProvider.notifier).state =
                      value;
                },
                value: switchValue,
              );
            },
          ),
        ],
      ),
    );
  }
}
