import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/device_spec/presentation/screens/device_spec_screen.dart';
import 'package:clean_arc_phony/home/presentation/components/brands_list_component.dart';
import 'package:clean_arc_phony/core/utils/app_constance.dart';
import 'package:clean_arc_phony/home/presentation/components/latest_devices_component.dart';
import 'package:clean_arc_phony/home/presentation/controller/search_result_bloc.dart';
import 'package:clean_arc_phony/top_by_fans_devices/presentation/screens/top_by_fans_devices_screen.dart';
import 'package:clean_arc_phony/top_by_interest_devices/presentation/screens/top_by_interest_devices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: const Text(AppConstance.appName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DeviceSearch(
                  searchResultBloc: BlocProvider.of<SearchResultBloc>(context),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const TopByFansDevicesScreen(),
                        ),
                      );
                    },
                    child: const Text(AppConstance.topByFans),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0.r),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const BrandsListComponent();
                        },
                      );
                    },
                    child: const Text(AppConstance.brands),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const TopByInterestDevicesScreen(),
                        ),
                      );
                    },
                    child: const Text(AppConstance.topByInterest),
                  ),
                ),
              ),
            ],
          ),
          const LatestDevicesComponent(),
        ],
      ),
    );
  }
}

class DeviceSearch extends SearchDelegate {
  SearchResultBloc searchResultBloc;

  DeviceSearch({required this.searchResultBloc});

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      });

  @override
  Widget buildResults(BuildContext context) {
    searchResultBloc.add(GetSearchResultEvent(query));

    return BlocBuilder<SearchResultBloc, SearchResultState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            if (query.isEmpty) {
              return Container();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case RequestState.loaded:
            if (state.searchResult.isEmpty) {
              state.requestState = RequestState.loading;
              return Center(
                  child: Text(
                AppConstance.sorryNotFound,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ));
            } else {
              return ListView.builder(
                itemCount: state.searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  state.requestState = RequestState.loading;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DeviceSpecScreen(
                            slug: state.searchResult[index].slug,
                            deviceName: state.searchResult[index].deviceName,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.r),
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r)),
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Image.network(
                                    state.searchResult[index].image),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                "${state.searchResult[index].brand} ${state.searchResult[index].deviceName}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          case RequestState.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
