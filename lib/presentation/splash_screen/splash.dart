import 'package:astra_testscase/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:astra_testscase/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const Align(
              alignment: Alignment(0, -0.4),
              child: Text("Pokedex by Elmo",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF005197))),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
            ),
            Align(
                alignment: const Alignment(0, 0.5),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF005197),
                        shape: const StadiumBorder()),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => DashboardBloc(),
                            child: const DashboardPage(),
                          ),
                        )),
                    icon: const Icon(Icons.start),
                    label: const Text("Start"))),
          ],
        ),
      ),
    );
  }
}
