import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/location.dart';

class ListLocations extends StatelessWidget {
  const ListLocations({
    Key? key,
    required this.locations,
    required this.onTapLocation,
  }) : super(key: key);

  final List<Location> locations;
  final Function(Location) onTapLocation;

  @override
  Widget build(BuildContext context) {
    return locations.isEmpty
        ? Center(child: Text('No matches found 😕'))
        : Container(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (_, i) {
                final location = locations[i];
                return Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text(location.title),
                    subtitle: Text(location.locationType),
                    onTap: () => onTapLocation(location),
                  ),
                );
              },
            ),
          );
  }
}
