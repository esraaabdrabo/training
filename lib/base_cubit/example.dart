import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/base_cubit/data_cubit.dart';

class BaseCubitExample extends StatelessWidget {
  const BaseCubitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DataCubit(DataInit())..fetch(),
        child: BaseCubitConsumer<DataCubit, DataStates>(
          builder: (context, state) {
            return Center(
                child: state is DataInit ? const Text("init") : Text("data"));
          },
          listener: (state) {},
        ),
      ),
    );
  }
}

class BaseCubitConsumer<block extends StateStreamable<States>, States>
    extends StatelessWidget {
  final Function(States state) listener;
  final Function(BuildContext context, States state) builder;
  const BaseCubitConsumer(
      {required this.listener, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<block, States>(
      builder: (cnt, state) => builder(cnt, state),
      listener: (cnt, state) {
        if (state is BaseShowLoadingState) {
          log("is show loading");
          showDialog(
            context: cnt,
            builder: (cnt) => const AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          );
        } else if (state is BaseHideLoadingState) {
          Navigator.pop(cnt);
        } else if (state is BaseUnAuthorizedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(
                    child: Text("un Authorized"),
                  ),
                ),
              ));
        } else {
          listener(state);
        }
      },
    );
  }
}
