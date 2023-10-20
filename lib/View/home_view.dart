import 'package:flutter/material.dart';
import 'package:movie_database/View/favorites_view.dart';
import 'package:movie_database/View/movies_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  final pages = [
    MoviesView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations:const  [
          NavigationDestination(icon: Icon(Icons.list_outlined),selectedIcon:Icon(Icons.list), label: 'Lista de Filmes'),
          NavigationDestination(icon: Icon(Icons.favorite_border_outlined),selectedIcon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}