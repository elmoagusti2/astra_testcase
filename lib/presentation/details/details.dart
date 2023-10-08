import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astra_testscase/common/enum.dart';
import 'package:astra_testscase/presentation/details/bloc/details_bloc.dart';
import 'package:astra_testscase/presentation/widgets/detail_pokemons/detail_about.dart';
import 'package:astra_testscase/presentation/widgets/detail_pokemons/detail_base_stats.dart';
import 'package:astra_testscase/presentation/widgets/header.dart';
import 'package:astra_testscase/presentation/widgets/shimmer.dart';

class DetailsPage extends StatefulWidget {
  final int? id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  List<Widget> list = [
    const Tab(
        child: Text(
      'About',
      style: TextStyle(color: Colors.black),
    )),
    const Tab(
        child: Text(
      'Base Stats',
      style: TextStyle(color: Colors.black),
    ))
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    context.read<DetailsBloc>().add(GetDetails(id: widget.id));
    _controller?.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
      child: SafeArea(
        child: BlocConsumer<DetailsBloc, DetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                const HeaderBackButton(),
                Align(
                    alignment: const Alignment(0.8, -0.8),
                    child: Text(
                      '#${widget.id}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    )),
                topContent(state),
                bottomContent(context, state),
                Align(
                    alignment: const Alignment(0, -0.5),
                    child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png',
                      height: 300,
                      width: 300,
                    ))
              ],
            );
          },
        ),
      ),
    ));
  }

  Align bottomContent(BuildContext context, DetailsState state) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(
              height: 38,
            ),
            TabBar(
              tabs: list,
              controller: _controller,
              indicatorColor: Colors.black,
              indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
              labelPadding: const EdgeInsets.all(0),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  state.requestState == RequestState.success
                      ? aboutDetails(state)
                      : Padding(
                          padding: const EdgeInsets.all(24),
                          child: Shimmers.shimmerCustom(width: 1, height: 1),
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: state.requestState == RequestState.success
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var item in state.detailPokemons.stats!)
                                DetailBaseStats(
                                    title: '${item.stat?.name}',
                                    value: item.baseStat,
                                    indicator: item.baseStat! >= 100
                                        ? 100 / 100
                                        : item.baseStat! / 100),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(24),
                            child: Shimmers.shimmerCustom(width: 1, height: 1),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align topContent(DetailsState state) {
    return Align(
        alignment: const Alignment(-0.8, -0.89),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.requestState == RequestState.success
                      ? Text(
                          '${state.detailPokemons.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      : Shimmers.shimmerCustom(height: 30, width: 100),
                  state.requestState == RequestState.success
                      ? Row(
                          children: [
                            for (var item in state.detailPokemons.types!)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text('${item.type?.name}'),
                                ),
                              ),
                          ],
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 5),
                          child:
                              Shimmers.shimmerCustom(height: 30, width: 200)),
                ],
              ),
            )));
  }

  Padding aboutDetails(DetailsState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailAbouts(
              title: 'Species', value: '${state.detailPokemons.species?.name}'),
          const SizedBox(
            height: 16,
          ),
          DetailAbouts(
              title: 'Height', value: '${state.detailPokemons.height}'),
          const SizedBox(
            height: 16,
          ),
          DetailAbouts(title: 'Width', value: '${state.detailPokemons.weight}'),
          const SizedBox(
            height: 16,
          ),
          DetailAbouts(
              title: 'Abilities',
              value:
                  '${state.detailPokemons.abilities?.map((e) => e.ability?.name ?? '').join(', ')}'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
