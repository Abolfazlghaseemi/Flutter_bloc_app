import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/bloc/Counter_Event.dart';
import 'package:flutter_bloc_application/bloc/Counter_bloc.dart';
import 'package:flutter_bloc_application/bloc/Counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                  builder: ((context, state) {
                if (state is CounterInit) {
                  return Text(
                    '${state.counter}',
                    style: TextStyle(fontSize: 60),
                  );
                }
                if (state is UpdatedCounter) {
                  return Text(
                    '${state.counter}',
                    style: TextStyle(fontSize: 60),
                  );
                }
                return Text('error');
              })),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecreamentPressed());
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 24),
                  )),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreaementPressed());
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 24),
                  )),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetPressed());
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
