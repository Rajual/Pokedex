import '../models/exports.dart';
import 'enums.dart';

SvgDimensionsModel _getSvgDimensions(SvgSize size) {
  switch (size) {
    case SvgSize.small:
      return const SvgDimensionsModel(size: 24.0);
    case SvgSize.medium:
      return const SvgDimensionsModel(size: 48.0);
    case SvgSize.large:
      return const SvgDimensionsModel(size: 96.0);
  }
}

SvgDimensionsModel getSvgDimensions(SvgSize size) => _getSvgDimensions(size);
