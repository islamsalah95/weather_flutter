import 'package:block/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends StatefulWidget {
  const HomeCubit({super.key, required this.title});

  final String title;

  @override
  State<HomeCubit> createState() => _HomeCubitState();
}

class _HomeCubitState extends State<HomeCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state is CounterInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      'You have pushed Cubit the button this many times:'),
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        icon: const Icon(Icons.minimize),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().reset();
                        },
                        icon: const Icon(Icons.reset_tv_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is CounterValueChange) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      'You have pushed Cubit the button this many times:'),
                  Text('${state.value}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        icon: const Icon(Icons.minimize),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterCubit>().reset();
                        },
                        icon: const Icon(Icons.reset_tv_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
