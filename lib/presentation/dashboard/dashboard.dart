import 'dart:async';

import 'package:astra_testscase/common/enum.dart';
import 'package:astra_testscase/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_testscase/presentation/details/bloc/details_bloc.dart';
import 'package:astra_testscase/presentation/details/details.dart';
import 'package:astra_testscase/presentation/widgets/card_pokemon.dart';
import 'package:astra_testscase/presentation/widgets/shimmer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final debouncer = Debouncer(milliseconds: 600);
  final TextEditingController txtSearch = TextEditingController();
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() {
    context.read<DashboardBloc>().add(GetPokemons());
  }

  static int linkConvert(String url) {
    List<String> parts = url.split('/');
    String numberString = parts[parts.length - 2];
    int number = int.tryParse(numberString) ?? 0;
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      height: 40,
                      child: TextField(
                        controller: txtSearch,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          labelText: 'Search',
                        ),
                        onChanged: (value) {
                          debouncer.run(() => context
                              .read<DashboardBloc>()
                              .add(SearchPokemons(search: value)));
                        },
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.success) {
                    return state.listPokemons.isNotEmpty
                        ? GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            crossAxisSpacing: 13,
                            children: [
                              for (var item in state.listPokemons)
                                CardPokemon(
                                  name: item.name,
                                  url:
                                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${linkConvert(item.url!)}.png',
                                  onChanged: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  DetailsBloc(),
                                              child: DetailsPage(
                                                  id: linkConvert(item.url!)),
                                            )),
                                  ),
                                )
                            ],
                          )
                        : const Center(
                            child: Text(
                              'No data',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                  }
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 13,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (var i = 0; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Shimmers.shimmerCustom(),
                        ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
