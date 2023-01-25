import 'package:fav_provider/provider/favourite_provider.dart';
import 'package:fav_provider/screen/fovourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 100,
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
