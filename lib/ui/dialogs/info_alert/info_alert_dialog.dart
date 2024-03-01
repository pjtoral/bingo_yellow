import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
//import 'package:bingo_yellow/ui/views/home/home_viewmodel.dart';
import 'info_alert_dialog_model.dart';


class InfoAlertDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InfoAlertDialogModel>.reactive(
      viewModelBuilder: () => InfoAlertDialogModel(request),
      builder: (context, viewModel, child) => _buildDialog(context, viewModel),
    );
  }

  Widget _buildDialog(BuildContext context, InfoAlertDialogModel viewModel) {
    String? selectedCategory;

    return AlertDialog(
      title: const Text('Select Bingo Category'),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                hint: const Text('Select Bingo Category'),
                value: selectedCategory,
                items: [
                  'Black out',
                  'X',
                  'Cross',
                  'L',
                  'Corners',
                  'Line Vertical',
                  'Line Horizontal',
                ].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              MaterialButton(
                onPressed: () {
                  viewModel.navigateToBingo();
                },
                child: const Text('Generate'),
              ),
            ],
          );
        },
      ),
    );
  }
}
