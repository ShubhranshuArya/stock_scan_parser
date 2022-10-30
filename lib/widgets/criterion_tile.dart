import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/model/stock_scan_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget Class that builds the criterion tile.
class CriterionTile extends StatelessWidget {
  final Criterion criterion;
  const CriterionTile({
    Key? key,
    required this.criterion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> newStr = [];
    String firVal = '';
    String secVal = '';

    /// Conditional statement to seperate
    /// 'variable' values from 'plain_text' values.
    if (criterion.type == 'variable') {
      /// Splits the criterion by the number of '$'
      /// values present in the stirng.
      newStr = criterion.text!.split('\$');
      firVal = getDefaultType(newStr[1][0]);
      if (newStr.length > 2) {
        secVal = getDefaultType(newStr[2][0]);
      }
    }

    return Container(
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: criterion.type == 'variable'
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: newStr[0]),
                      TextSpan(
                        style: const TextStyle(color: blueColor),
                        text: '($firVal)',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            List? valList = getValuesList(newStr[1][0]);
                            if (valList == null) {
                              parametersBottomSheet(
                                  getDefaultType(newStr[1][0]));
                            } else {
                              valueBottomSheet(values: valList);
                            }
                          },
                      ),
                      TextSpan(
                        text: newStr[1].substring(1),
                      ),
                      if (newStr.length > 2)
                        TextSpan(
                          style: const TextStyle(color: Colors.blue),
                          text: '($secVal)',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              List? valList = getValuesList(newStr[2][0]);
                              if (valList == null) {
                                parametersBottomSheet(
                                    getDefaultType(newStr[2][0]));
                              } else {
                                valueBottomSheet(
                                  values: valList,
                                );
                              }
                            },
                        ),
                      if (newStr.length > 2)
                        TextSpan(
                          text: newStr[2].substring(1),
                        ),
                    ],
                  ),
                )
              : Text(
                  criterion.text!,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }

  // Function to open a bottom sheet to set parameters.
  void parametersBottomSheet(String defaultValue) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        child: Column(
          children: [
            const Text('Set Parameters'),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: defaultValue,
              decoration: InputDecoration(
                hintText: 'Period',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // Function to open a bottom sheet to select values.
  void valueBottomSheet({required List values}) {
    Get.bottomSheet(
      Container(
        height: 260,
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: values.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text(
                '${values[index]}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.5,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // Function that returns a list of values for variables.
  List? getValuesList(String val) {
    switch (val) {
      case '1':
        {
          if (criterion.variable!.type1!.values == null) {
            return null;
          }
          final list = criterion.variable!.type1!.values!;
          list.sort();
          return list;
        }
      case '2':
        {
          final list = criterion.variable!.type2!.values!;
          list.sort();
          return list;
        }
      case '3':
        {
          final list = criterion.variable!.type3!.values!;
          list.sort();
          return list;
        }
      default:
        {
          return null;
        }
    }
  }

  // Function that returns the default value of the variable.
  String getDefaultType(String val) {
    switch (val) {
      case '1':
        {
          return (criterion.variable!.type1!.type == 'indicator')
              ? criterion.variable!.type1!.defaultValue.toString()
              : criterion.variable!.type1!.values![0].toString();
        }
      case '2':
        {
          return criterion.variable!.type2!.values![0].toString();
        }
      case '3':
        {
          return criterion.variable!.type3!.values![0].toString();
        }
      default:
        {
          return criterion.variable!.type4!.defaultValue.toString();
        }
    }
  }
}
