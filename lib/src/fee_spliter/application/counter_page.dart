import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$state'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => context.read<CounterCubit>().increment(),
                      icon: const Icon(Icons.add)),
                  IconButton(
                      onPressed: () => context.read<CounterCubit>().decrement(),
                      icon: const Icon(Icons.remove)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
