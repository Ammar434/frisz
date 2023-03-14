import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';

class CityPicker extends StatefulWidget {
  const CityPicker({
    super.key,
  });

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  String? stateValue = "";
  String? cityValue = "";
  String? countryValue = "";

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      layout: Platform.isAndroid ? Layout.vertical : Layout.horizontal,
      showCities: false,
      //showStates: false,
      dropdownDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),

      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
      disabledDropdownDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),

      ///placeholders for dropdown search field
      countrySearchPlaceholder: "countrySearchPlaceholder".tr(),
      stateSearchPlaceholder: "stateSearchPlaceholder".tr(),
      citySearchPlaceholder: "citySearchPlaceholder".tr(),

      ///labels for dropdown
      countryDropdownLabel: "countryDropdownLabel".tr(),
      stateDropdownLabel: "stateDropdownLabel".tr(),
      cityDropdownLabel: "cityDropdownLabel".tr(),

      ///Country Filter [OPTIONAL PARAMETER]
      countryFilter: const [
        CscCountry.France,
        CscCountry.Spain,
        CscCountry.United_Kingdom,
      ],

      ///selected item style [OPTIONAL PARAMETER]
      selectedItemStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),

      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
      dropdownHeadingStyle: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

      ///DropdownDialog Item style [OPTIONAL PARAMETER]
      dropdownItemStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),

      ///Dialog box radius [OPTIONAL PARAMETER]
      dropdownDialogRadius: kRadiusValue,

      ///Search bar radius [OPTIONAL PARAMETER]
      searchBarRadius: kRadiusValue,

      ///triggers once country selected in dropdown
      onCountryChanged: (value) {
        setState(() {
          ///store value in country variable
          temporaryCountry = value;
        });
      },

      ///triggers once state selected in dropdown
      onStateChanged: (value) {
        setState(() {
          ///store value in state variable
          temporaryState = value ?? "";
        });
      },

      ///triggers once city selected in dropdown
      onCityChanged: (value) {
        setState(() {
          ///store value in city variable
          cityValue = value;
        });
      },
    );
  }
}
