import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:wather_app/ui/home_page/components/custom_loader.dart';
import 'package:wather_app/ui/home_page/components/layouts/home_page_landscape.dart';
import 'package:wather_app/ui/home_page/components/layouts/home_page_portrait.dart';
import 'package:wather_app/ui/home_page/components/location_searcher.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_bloc.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _showLocationSearcher(BuildContext context) async {
    final location = await showSearch(
      context: context,
      delegate: LocationsSearcher(homePageBloc: context.read()),
    );

    if (location != null) {
      context.read<HomePageBloc>().loadForecastLocation(location);
    }
  }

  _showErrorMessage(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7a9aeb),
      body: SafeArea(
        child: BlocConsumer<HomePageBloc, HomepageState>(
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              _showErrorMessage(context, state.error);
            }
          },
          builder: (context, state) {
            // first open
            if (state.selectedLocation == null && !state.loadingForecast) {
              return _buildWelcomeMessage(context);
            }

            // loading forecast info
            if (state.loadingForecast) {
              return CustomLoader(title: 'Loading forecast');
            }

            // display forecast info
            return _buildForecastInfo(context, state);
          },
        ),
      ),
    );
  }

  Column _buildForecastInfo(BuildContext context, HomepageState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAppBar(context),
        if (state.selectedLocation != null)
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.landscape
                      ? HomePageLandscapeLayout(
                          location: state.selectedLocation!,
                        )
                      : HomePageProtrait(
                          location: state.selectedLocation!,
                        ),
            ),
          ),
      ],
    );
  }

  Center _buildWelcomeMessage(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showLocationSearcher(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Touch me to find a city.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: () => _showLocationSearcher(context),
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
