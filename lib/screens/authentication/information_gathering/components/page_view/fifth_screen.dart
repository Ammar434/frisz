import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/bottom_row.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(
        kRadiusValue,
      )),
      color: Theme.of(context).splashColor,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserImageSelector(
            isSelectable: false,
          ),
          Column(
            children: [
              Text(
                "page_view_5_1",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              const SizedBox(
                height: kPaddingValue,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: temporaryProfession,
                  onChanged: (value) {
                    setState(() {
                      temporaryProfession = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: kPaddingValue * 3,
                    // width: 160,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: boxDecoration,
                  ),
                  iconStyleData: IconStyleData(
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Theme.of(context).hintColor,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    // width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).cardColor,
                    ),
                    elevation: 3,
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(kRadiusValue),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
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
