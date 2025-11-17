import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'no_existing_band_page_widget.dart' show NoExistingBandPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NoExistingBandPageModel
    extends FlutterFlowModel<NoExistingBandPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
