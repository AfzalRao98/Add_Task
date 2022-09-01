import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/screens/view_task.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:flutter_golang_yt/widgets/task_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ['Try harder', 'Try smarter'];
    final leftEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final RightDeleteIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 40),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/header1.jpg'))),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: RightDeleteIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    color: Color(0xFF2e3253).withOpacity(0.4),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Get.to(()=>ViewTask(id: index));
                                        },
                                          child: ButtonWidget(
                                              backgroundcolor:
                                                  AppColors.mainColor,
                                              text: 'View',
                                              textColor: Colors.white)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ButtonWidget(
                                          backgroundcolor: AppColors.mainColor,
                                          text: 'Edit',
                                          textColor: Colors.white),
                                    ],
                                  ),
                                ),
                              );
                            });
                        return false;
                      } else {
                        return Future.delayed(Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart);
                      }
                      ;
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TaskWidget(
                          text: myData[index], color: Colors.blueGrey),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
