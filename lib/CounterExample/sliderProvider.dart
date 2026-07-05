import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider<double>((ref) {
  return 0.0;
});

class SliderExample extends ConsumerWidget {
  const SliderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sliderValue = ref.watch(sliderProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              final Svalue = ref.watch(sliderProvider);
              print("Print 5");
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(sliderValue),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return Slider(
                onChanged: (value) {
                  ref.read(sliderProvider.notifier).state = value;
                  print("Print 6");
                },
                value: sliderValue,
              );
            },
          ),
        ],
      ),
    );
  }
}
