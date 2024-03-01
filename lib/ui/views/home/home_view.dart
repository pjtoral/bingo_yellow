import 'package:bingo_yellow/themes/theme.dart';
//import 'package:bingo_yellow/ui/dialogs/info_alert/info_alert_dialog.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/8_jpg.png', // Path to your image in the assets folder
                  width: 300, // Set width of the image
                  height: 300, // Set height of the image
                ),
                SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    children: [
                      for (int i = 0; i < 'PLAY NOW'.length; i++)
                        TextSpan(
                          text: 'PLAY NOW'[i],
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w400,
                            color: getColorForLetter(i),
                            shadows: [
                              Shadow(
                                color:
                                    Colors.black.withOpacity(1), // Shadow color
                                offset: const Offset(3, 3), // Shadow offset
                                blurRadius: 0, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // _showCategoryModal(context, viewModel);
                      viewModel.showDialog();
                    },
                    child: SizedBox(
                      height: 25,
                      width: 100,
                      child: Center(
                        child: Text('Start',
                            style: bingoTheme.textTheme.displaySmall),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}