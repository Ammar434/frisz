import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/utils.dart';

class UserImageSelector extends StatefulWidget {
  UserImageSelector({
    super.key,
    this.isSelectable = true,
  });

  final bool isSelectable;

  @override
  State<UserImageSelector> createState() => _UserImageSelectorState();
}

class _UserImageSelectorState extends State<UserImageSelector> {
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      temporaryUserImage = im;
    });
  }

  final borderWidth = 1.0;
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  );
  final kGradientBoxDecoration = BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Color(0xff2781ed),
        Color(0xff00f6c6),
      ],
      center: Alignment.bottomRight,
      radius: 0.8,
    ),
    shape: BoxShape.circle,
    border: Border.all(
      width: 5,
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !widget.isSelectable ? EdgeInsets.only(top: kPaddingValue * 2) : EdgeInsets.zero,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: kGradientBoxDecoration,
            child: Padding(
              padding: EdgeInsets.all(borderWidth),
              child: DecoratedBox(
                decoration: kInnerDecoration,
                child: temporaryUserImage != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(
                          temporaryUserImage!,
                        ),
                        // backgroundColor: Colors.red,
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          'https://i.stack.imgur.com/l60Hf.png',
                        ),
                        // backgroundColor: Colors.red,
                      ),
              ),
            ),
          ),
          Visibility(
            visible: widget.isSelectable,
            child: Positioned(
              bottom: -20,
              right: -10,
              child: IconButton(
                onPressed: selectImage,
                icon: Icon(Icons.add_a_photo),
              ),
            ),
          )
        ],
      ),
    );
  }
}
