import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/bottom_row.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/utils/sports_list.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
                "page_view_6_1",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              const SizedBox(
                height: kPaddingValue,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  items: availaibleSportEn
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )
                      .toList(),
                  value: temporaryFavoriteSport,
                  onChanged: (value) {
                    setState(() {
                      temporaryFavoriteSport = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: kPaddingValue * 3,
                    // width: 160,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: boxDecoration,
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    maxHeight: 200,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
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
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: "search_sport".tr(),
                          hintStyle: const TextStyle(fontSize: 12),
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
          BottomRow(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
