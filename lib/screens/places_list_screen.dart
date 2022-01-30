import 'package:app05places/providers/great_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text('Nenhum local cadastrad'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(greatPlaces.itemByIndex(i).image),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
