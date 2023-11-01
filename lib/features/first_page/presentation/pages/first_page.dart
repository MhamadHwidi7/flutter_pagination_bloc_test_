import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination_bloc_test/core/router/app_router.gr.dart';

@RoutePage()
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Select Page To Navigate'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    context.pushRoute(const HomeRoute());
                  },
                  child: const Text('Pokemon'))),
          Center(
              child: TextButton(
                  onPressed: () {
                    context.pushRoute(const PokemonEvalutionRoute());
                  },
                  child: const Text('Pokemon Evaluation')))
        ],
      ));
}
