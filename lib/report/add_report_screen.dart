import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reporting_system/appcolor/appcolor.dart';
import 'package:reporting_system/common/common_form_field.dart';
import 'package:reporting_system/login/login_scren.dart';
import 'package:reporting_system/report/bloc/add_report_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reporting_system/reportList/report_list_screen.dart';

class AddReportScreen extends StatefulWidget {
  final String username;

  const AddReportScreen({Key key, this.username}) : super(key: key);
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ReportBloc bloc = ReportBloc();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    this.bloc.userName = widget.username;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Report"),
          backgroundColor: AppColor.kPrimaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: IconButton(
                  tooltip: "History",
                  icon: Icon(
                    Icons.horizontal_split_outlined,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReportListScreen(userName: widget.username)));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  tooltip: "Log out",
                  icon: Icon(
                    Icons.logout,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: commonFormField(
                    autoFocus: false,
                    stream: bloc.descriptionController,
                    hintText: "Description",
                    maxLength: 500,
                    maxLines: 7,
                    onChanged: (value) {
                      bloc.descriptionController.sink.add(value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Description field is required";
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: AppColor.kPrimaryColor,
                          size: 40,
                        ),
                        onPressed: () async {
                          await launchCamera();
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Status :",
                          style: TextStyle(
                              color: AppColor.kTextColor, fontSize: 18),
                          children: [
                            TextSpan(
                              text: "Pending",
                              style: TextStyle(
                                  color: AppColor.kTextColor, fontSize: 18),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.kPrimaryColor),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    bloc.submitReport();
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // camera
  launchCamera() async {
    PickedFile _pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    File _file = File(_pickedFile.path);

    if (_file != null) {
      int sizeInBytes = _file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb < 100) {
        bloc.imageUploadController.sink.add(_pickedFile.path);
      } else {
        Fluttertoast.showToast(
            msg: "File Size Exceeds 500mb!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.kTextBoxFillColor,
            textColor: AppColor.kPrimaryColor,
            fontSize: 16.0);
      }
    }
  }
}
