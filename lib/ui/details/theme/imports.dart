import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grand_edu/ui/details/formula/imports.dart';
import 'package:grand_edu/ui/details/video/imports.dart';
import 'package:grand_edu/ui/pages/themes/imports.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../models/cat_model.dart';
import '../../../models/homework_model.dart';
import '../../../models/theme_model.dart';
import '../../../models/unit_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/fb_service.dart';
import '../../../utils/lan.dart';
import '../../../utils/titles.dart';
import '../../../utils/utils.dart';
import '../../pages/login/constants.dart';
import '../test/imports.dart';

part 'items.dart';
part 'page.dart';
part 'vm.dart';