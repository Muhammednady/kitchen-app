import 'package:Kitchen_system/model/response/client_emails_model.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:flutter/material.dart';

class CustomDropDownClients extends StatelessWidget {
  const CustomDropDownClients({super.key, this.type, this.list, this.onchange});

  final Clients? type;
  final List<Clients>? list;
  final Function(Clients?)? onchange;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      shadowColor: ColorResources.CATEGORY_SHADOW,
      child: DropdownButtonFormField<Clients>(
        isExpanded: true,
        value: type,
        onChanged: onchange,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxHeight: 50),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none)),
        items: list!.map<DropdownMenuItem<Clients>>((Clients type) {
          return DropdownMenuItem<Clients>(
            value: type,
            child: Text(type.clientName ?? ""),
          );
        }).toList(),
      ),
    );
  }
}
