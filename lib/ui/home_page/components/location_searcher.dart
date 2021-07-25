import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/ui/home_page/components/custom_loader.dart';
import 'package:wather_app/ui/home_page/components/list_locations.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_bloc.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_state.dart';

class LocationsSearcher extends SearchDelegate<Location> {
  Timer? _searchWhenUserStopTyping;

  LocationsSearcher({
    required this.homePageBloc,
  });

  final HomePageBloc homePageBloc;

  _showErrorMessage(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  String? get searchFieldLabel => 'Type a city ej: milan';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomepageState>(
      bloc: homePageBloc,
      builder: (context, state) {
        return state.loadingLocations
            ? CustomLoader(
                title: 'Loading locations',
                color: Colors.blueAccent,
                textColor: Colors.blueAccent,
              )
            : ListLocations(
                locations: state.locationsResult,
                onTapLocation: (location) => close(context, location),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (_searchWhenUserStopTyping != null) {
      _searchWhenUserStopTyping?.cancel();
    }

    // wait 500 ms to send event to bloc
    _searchWhenUserStopTyping = Timer(Duration(milliseconds: 500), () async {
      if (query.isNotEmpty && query.length > 2) {
        homePageBloc.searchLocation(query);
      }
    });

    return BlocConsumer<HomePageBloc, HomepageState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          _showErrorMessage(context, state.error);
        }
      },
      bloc: homePageBloc,
      builder: (context, state) {
        return state.loadingLocations
            ? CustomLoader(
                title: 'Loading locations',
                color: Colors.blueAccent,
                textColor: Colors.blueAccent,
              )
            : ListLocations(
                locations: state.locationsResult,
                onTapLocation: (location) => close(context, location),
              );
      },
    );
  }
}
