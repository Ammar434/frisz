import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/utils.dart';
import '../bottom_row.dart';
import '../user_image_selector.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar

    setState(() {
      temporaryUserImage = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "page_view_2_1",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
          ).tr(),
          Column(
            children: [
              const UserImageSelector(),
              const SizedBox(
                height: kPaddingValue,
              ),
              GestureDetector(
                onTap: selectImage,
                child: Text(
                  "page_view_2_2",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).tr(),
              ),
            ],
          ),
          BottomRow(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
