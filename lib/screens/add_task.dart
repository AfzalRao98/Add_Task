import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:flutter_golang_yt/widgets/error_warning_ms.dart';
import 'package:flutter_golang_yt/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation(){
      if(nameController.text.trim()==''){
        Message.taskErrorOrWarning("Task name", "Your task name is empty");
        return false;
      }else if(detailController.text.trim()==''){
        Message.taskErrorOrWarning("Task detail", "Your task detail is empty");
      }
      return true;
    }

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
              children: [
                TextFieldWidget(
                    hintText: 'Task name',
                    textController: nameController,
                    borderRadius: 30,readOnly: false,),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintText: 'Task detail',
                  textController: detailController,
                  borderRadius: 15,
                  maxLines: 3,
                  readOnly: false,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    _dataValidation();
                  },
                  child: ButtonWidget(
                      backgroundcolor: AppColors.mainColor,
                      text: 'Add',
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
