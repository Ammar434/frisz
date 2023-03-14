import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/bottom_row.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/utils/profession_list.dart';

class FifthScreen extends StatefulWidget {
  FifthScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(
        kRadiusValue,
      )),
      color: Theme.of(context).splashColor,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    );

    return Padding(
      padding: EdgeInsets.all(kPaddingValue),
      child: Column(
        children: [
          Expanded(
            child: UserImageSelector(
              isSelectable: false,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "page_view_5_1",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                ).tr(),
                SizedBox(
                  height: kPaddingValue,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'page_view_5_2'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    items: availaibleProfessionFr
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
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
                      padding: EdgeInsets.only(left: 14, right: 14),
                      decoration: boxDecoration,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: "page_view_5_3".tr(),
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().toLowerCase().contains(searchValue.toLowerCase()));
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomRow(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
