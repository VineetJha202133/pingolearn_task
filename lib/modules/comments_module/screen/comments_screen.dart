import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn_task/modules/comments_module/controller/comments_controller.dart';
import 'package:pingolearn_task/modules/login_module/screen/login_screen.dart';
import 'package:pingolearn_task/utils/capitalize.dart';
import 'package:pingolearn_task/utils/constants.dart';
import 'package:pingolearn_task/utils/utils.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  CommentsController commentsController = CommentsController();
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      commentsController.fetchComments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommentsController>(
        create: (BuildContext context) => commentsController,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: titleText(
                text: 'Comments',
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
            backgroundColor: blue,
            actions: [
              IconButton(
                  onPressed: () {
                    signOut(context);
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
          backgroundColor: white,
          body: Builder(builder: (context) {
            return Consumer<CommentsController>(
                builder: (context, commentsConsumer, child) {
              return RefreshIndicator(
                onRefresh: () => commentsConsumer.fetchComments(),
                child: commentsConsumer.data.isEmpty ||
                        commentsConsumer.data == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: commentsConsumer.data.length,
                        itemBuilder: (context, index) {
                          var data = commentsConsumer.data[index];
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 6.h),
                            child:
                             ListTile(
                              tileColor: Colors.white,
                              dense: true,
                              
                              leading: CircleAvatar(
                                backgroundColor: grey,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: titleText(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                      text: capitalizeFirst(
                                          data['name'].substring(0, 1))),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Name : ',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextSpan(
                                          text: data['name'],
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  heightSpacer(5.h),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Email : ',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextSpan(
                                          text: data['email'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding:  EdgeInsets.only(top: 5.0.h),
                                child: titleText(
                                    text: data['body'],
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          );
                        },
                      ),
              );
            });
          }),
        ));
  }
}
