import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BINGO'),
                MaterialButton(
                  onPressed: () {
                    _showCategoryModal(context, viewModel); // Pass viewModel here
                  },
                  child: const Text('Start'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCategoryModal(BuildContext context, HomeViewModel viewModel) { // Receive viewModel here
    String? selectedCategory;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
      },
    );
  }
}
