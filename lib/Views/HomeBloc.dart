import 'package:block/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends StatefulWidget {
  const HomeBloc({super.key, required this.title});

  final String title;

  @override
  State<HomeBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(DecrementCounterEvent());
                        },
                        icon: const Icon(Icons.minimize),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(IncrementCounterEvent());
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(ResetEvent());
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
                  Text('${state.value}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(DecrementCounterEvent());
                        },
                        icon: const Icon(Icons.minimize),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(IncrementCounterEvent());
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(ResetEvent());
                        },
                        icon: const Icon(Icons.restore),
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
