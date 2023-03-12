import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

Future<List<List<dynamic>>> processCsv(BuildContext context, String filename) async {
  var result = await DefaultAssetBundle.of(context).loadString(
    filename,
  );
  return const CsvToListConverter().convert(result, eol: "\n");
}
