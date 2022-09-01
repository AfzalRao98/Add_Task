import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/addtask1.jpg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(
                    hintText: 'Task name',
                    textController: nameController,
                    borderRadius: 30, readOnly: true,),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintText: 'Task detail',
                  textController: detailController,
                  borderRadius: 15,
                  maxLines: 3,
                  readOnly: true,
                ),
                SizedBox(
                  height: 300,
                ),
            //     GestureDetector(
            //       onTap: (){
            //         _dataValidation();
            //       },
            //       child: ButtonWidget(
            //           backgroundcolor: AppColors.mainColor,
            //           text: 'Add',
            //           textColor: Colors.white),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height /12,
            // )
          ],
        ),
  ]),)
    );

  }
}
