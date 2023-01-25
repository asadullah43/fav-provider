import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class FavouriteItemScreen extends StatefulWidget {
  FavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: favouriteProvider.addFav.length,
              itemBuilder: ((context, index) {
                return Consumer<FavouriteProvider>(
                    builder: ((context, value, child) {
                  return ListTile(
                    onTap: (() {
                      if (value.addFav.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItem(index);
                      }
                    }),
                    title: Text('Item $index'),
                    trailing: Icon(value.addFav.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  );
                }));
              })),
        )
      ]),
    );
  }
}
