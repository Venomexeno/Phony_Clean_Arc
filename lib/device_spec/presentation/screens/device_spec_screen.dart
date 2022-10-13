import 'dart:async';

import 'package:clean_arc_phony/core/services/services_locator.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/device_spec/presentation/controller/device_spec_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DeviceSpecScreen extends StatelessWidget {
  final String slug;
  final String deviceName;

  const DeviceSpecScreen({
    Key? key,
    required this.slug,
    required this.deviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeviceSpecBloc>()..add(GetDeviceSpecEvent(slug)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(deviceName),
          centerTitle: true,
        ),
        body: BlocBuilder<DeviceSpecBloc, DeviceSpecState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                state.timer =
                    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
                  if (state.currentPage <
                      state.deviceSpec!.deviceImages.length - 1) {
                    state.currentPage++;
                  } else {
                    state.currentPage = 0;
                  }
                  state.controller.animateToPage(
                    state.currentPage,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeIn,
                  );
                });
                return Column(
                  children: [
                    Listener(
                      onPointerMove: (details) {
                        if (details.delta.dx > 0 || details.delta.dx < 0) {
                          state.timer.cancel();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: PageView.builder(
                          controller: state.controller,
                          itemCount: state.deviceSpec!.deviceImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0.h),
                                child: Expanded(
                                  child: CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl:
                                        state.deviceSpec!.deviceImages[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: state.controller,
                      count: state.deviceSpec!.deviceImages.length,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                      onDotClicked: (index) => state.controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: state.deviceSpec!.specifications.length,
                          shrinkWrap: true,
                          itemBuilder:
                              (BuildContext ctx, int specificationIndex) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        state
                                            .deviceSpec!
                                            .specifications[specificationIndex]
                                            .title,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state
                                            .deviceSpec!
                                            .specifications[specificationIndex]
                                            .specs
                                            .length,
                                        itemBuilder: (BuildContext context,
                                            int specsIndex) {
                                          return Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      state
                                                          .deviceSpec!
                                                          .specifications[
                                                              specificationIndex]
                                                          .specs[specsIndex]
                                                          .key,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      state
                                                          .deviceSpec!
                                                          .specifications[
                                                              specificationIndex]
                                                          .specs[specsIndex]
                                                          .val
                                                          .toString()
                                                          .substring(
                                                              1,
                                                              state
                                                                      .deviceSpec!
                                                                      .specifications[
                                                                          specificationIndex]
                                                                      .specs[
                                                                          specsIndex]
                                                                      .val
                                                                      .toString()
                                                                      .length -
                                                                  1),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              specsIndex ==
                                                      state
                                                              .deviceSpec!
                                                              .specifications[
                                                                  specificationIndex]
                                                              .specs
                                                              .length -
                                                          1
                                                  ? Container()
                                                  : const Divider(thickness: 1),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                specificationIndex ==
                                        state.deviceSpec!.specifications
                                                .length -
                                            1
                                    ? Container()
                                    : const Divider(thickness: 2),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              case RequestState.error:
                return Center(
                  child: Text(state.errorMessage),
                );
            }
          },
        ),
      ),
    );
  }
}
