import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

class CustomTextFieldComment extends StatelessWidget {
  const CustomTextFieldComment(
      {super.key, this.send, this.persons, this.onChange, this.pickFile});

  final Function()? send;
  final Function()? pickFile;
  final Function(String)? onChange;
  final List<Map<String, dynamic>>? persons;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        5.sBW,
        Expanded(
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_FIFTY),
            child: Center(
              child: FlutterMentions(
                onChanged: onChange,
                key: key,
                suggestionPosition: SuggestionPosition.Top,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    suffixIconConstraints:
                        const BoxConstraints(minHeight: 25, minWidth: 25),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: pickFile,
                        child: Image.asset(Images.addFile,
                            width: 25,
                            height: 25,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SIZE_FIFTY)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SIZE_FIFTY)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'write something .....',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SIZE_FIFTY))),
                mentions: [
                  Mention(
                      trigger: '@',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      data: persons ?? [],
                      matchAll: false,
                      suggestionBuilder: (data) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(data['full_name']
                                      .toString()
                                      .substring(0, 1)),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(data['full_name']),
                                    Text('@${data['display']}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        5.sBW,
        GestureDetector(
          onTap: send,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
            child: Center(
              child: Image.asset(Images.send,
                  color: Colors.white, width: 20, height: 20),
            ),
          ),
        ),
        5.sBW,
      ],
    );
  }
}
