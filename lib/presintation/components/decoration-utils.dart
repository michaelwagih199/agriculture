import 'package:agriculture/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/appStyleConfig.dart';

BoxDecoration backGroundPattern() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(IMAGE_BACK_PATTERN),
      fit: BoxFit.cover,
      opacity: 0.3,
    ),
  );
}
