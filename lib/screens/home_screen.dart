import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: '\nStart your beautiful day',
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  )
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height/2.5,
            ),
            InkWell(
              onTap: (){
                Get.to(()=>AddTask(), transition: Transition.zoom, duration: Duration(milliseconds:500));
              },
              child: ButtonWidget(
                  backgroundcolor: AppColors.mainColor,
                  text: 'Add Task',
                  textColor: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                Get.to(()=>AllTask(), transition: Transition.fade, duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                  backgroundcolor: Colors.white,
                  text: 'View All',
                  textColor: AppColors.smallTextColor),
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
      ),
    );
  }
}
