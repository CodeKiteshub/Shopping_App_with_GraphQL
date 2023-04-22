import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:styleclub/app/services/variables.dart';
import 'credentials.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:file_picker/file_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/photo_upload_controller.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'dart:io';

ApiClients mutation = ApiClients();

class PhotoUploadView extends StatefulWidget {
  const PhotoUploadView({Key? key}) : super(key: key);

  @override
  State<PhotoUploadView> createState() => _PhotoUploadViewState();
}

class _PhotoUploadViewState extends State<PhotoUploadView> {
  File? faceFile;
  File? frontFile;
  File? sideFile;
  File? backFile;

  SimpleS3 _simpleS3 = SimpleS3();
  bool isLoadingface = false;
  bool isLoadingback = false;
  bool isLoadingside = false;
  bool isLoadingfront = false;
  bool uploadedface = false;
  bool uploadedside = false;
  bool uploadedback = false;
  bool uploadedfront = false;
  String? netfront;
  String? netback;
  String? netsid;
  PhotoUploadController photoUploadController =
      Get.put(PhotoUploadController());

  @override
  void initState() {
    // TODO: implement initState
    if (photoUploadController.bodydata != null) {
      netfront = photoUploadController.bodydata!.getBodyProfile.frontPicture;
      netsid = photoUploadController.bodydata!.getBodyProfile.sidePicture;

      netback = photoUploadController.bodydata!.getBodyProfile.backPicture;
    }

    print(variables.profilepic);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _logException(String message) {
      print(message);
      // _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      // _scaffoldMessengerKey.currentState?.showSnackBar(
      //   SnackBar(
      //     content: Text(message),
      //   ),
      // );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle("We'd need your \nphotos"),
              20.heightBox,
              "Add a photo of you and your full body where you look the best"
                  .text
                  .white
                  .size(16.5)
                  .make()
                  .marginOnly(left: 20),
              10.heightBox,
              "Face"
                  .text
                  .fontFamily('poppins')
                  .bold
                  .white
                  .size(20)
                  .make()
                  .marginOnly(left: 20),
              20.heightBox,
              faceFile != null
                  ? isLoadingfront
                      ? Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Image.network(
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/upload.png"),
                            ),
                            10.heightBox,
                            "Preferably Smilling :)"
                                .text
                                .size(14)
                                .white
                                .make()
                                .centered(),
                            20.heightBox,
                          ],
                        )
                      : Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius:
                                    MediaQuery.of(context).size.height * 0.105,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(
                                    faceFile!,
                                    // height: MediaQuery.of(context).size.height * 0.3,
                                  ),
                                  radius:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                              ),
                            ),
                            10.heightBox,
                            "Preferably Smilling :)"
                                .text
                                .size(14)
                                .white
                                .make()
                                .centered(),
                            20.heightBox,
                          ],
                        )
                  : GestureDetector(
                      onTap: () async {
                        PickedFile _pickedFile = (await ImagePicker()
                            .getImage(source: ImageSource.gallery))!;

                        setState(() {
                          faceFile = File(_pickedFile.path);
                        });
                      },
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: variables.profilepic != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: MediaQuery.of(context).size.height *
                                        0.105,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          variables.profilepic
                                          // height: MediaQuery.of(context).size.height * 0.3,
                                          ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                    ),
                                  )
                                : Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/upload.png"),
                          ),
                          10.heightBox,
                          "Preferably Smilling :)"
                              .text
                              .size(14)
                              .white
                              .make()
                              .centered(),
                          20.heightBox,
                        ],
                      )),
              "Full Body"
                  .text
                  .bold
                  .fontFamily('poppins')
                  .white
                  .size(20)
                  .make()
                  .marginOnly(left: 20),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  frontFile != null
                      ? isLoadingfront
                          ? buildPhotoUpload("Front")
                          : Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(frontFile!
                                        // height: MediaQuery.of(context).size.height * 0.3,
                                        ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                ),
                                10.heightBox,
                                "Front".text.white.make()
                              ],
                            )
                      // : Image.file(
                      //     frontFile!,
                      //     width: 80,
                      //     height: 80,
                      //   )
                      : GestureDetector(
                          onTap: () async {
                            PickedFile _pickedFile = (await ImagePicker()
                                .getImage(source: ImageSource.gallery))!;
                            setState(() {
                              frontFile = File(_pickedFile.path);
                            });
                          },
                          child: netfront != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      netfront!,
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                )
                              : buildPhotoUpload("Front")),
                  sideFile != null
                      ? isLoadingside
                          ? buildPhotoUpload("Side")
                          : Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(
                                      sideFile!,
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                ),
                                10.heightBox,
                                "Front".text.white.make()
                              ],
                            )
                      : GestureDetector(
                          onTap: () async {
                            PickedFile _pickedFile = (await ImagePicker()
                                .getImage(source: ImageSource.gallery))!;
                            setState(() {
                              sideFile = File(_pickedFile.path);
                            });
                          },
                          child: netsid != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      netsid!,
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                )
                              : buildPhotoUpload("Side")),
                  backFile != null
                      ? isLoadingback
                          ? buildPhotoUpload("Back")
                          : Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(
                                      backFile!,
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                ),
                                10.heightBox,
                                "Front".text.white.make()
                              ],
                            )
                      : GestureDetector(
                          onTap: () async {
                            PickedFile _pickedFile = (await ImagePicker()
                                .getImage(source: ImageSource.gallery))!;
                            setState(() {
                              backFile = File(_pickedFile.path);
                            });
                          },
                          child: netback != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      netback!,
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                )
                              : buildPhotoUpload("Back")),
                  // buildPhotoUpload("Side"),
                  // buildPhotoUpload("Back"),
                ],
              ),
              50.heightBox,
              const ButtonPrimary(title: "Upload").onInkTap(() async {
                //  _uploadfront();
                await photoUploadController.gengrooming();
                await photoUploadController.genproduct();
                _uploadface();
                // _uploadside();
                // _uploadback();
                Get.toNamed(Routes.SUCCESS_PAGE);
              })
            ],
          ),
        ),
      )
          .box
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .width(double.infinity)
          .make(),
      // floatingActionButton: !isLoading
      //     ? FloatingActionButton(
      //         backgroundColor: uploaded ? Colors.green : Colors.blue,
      //         child: Icon(
      //           uploaded ? Icons.delete : Icons.arrow_upward,
      //           color: Colors.white,
      //         ),
      //         onPressed: () async {
      //           if (uploaded) {
      //             print(await SimpleS3.delete(
      //                 "test/${frontFile!.path.split("/").last}",
      //                 Credentials.s3_bucketName,
      //                 Credentials.s3_poolD,
      //                 AWSRegions.apSouth1,
      //                 debugLog: true));
      //             setState(() {
      //               frontFile = null;
      //               uploaded = false;
      //             });
      //           }
      //           if (frontFile != null) _upload();
      //         },
      //       )
      //     : null,
    );
  }

  Future<String?> _uploadface() async {
    String? result;

    if (result == null) {
      try {
        setState(() {
          isLoadingface = true;
        });
        result = faceFile != null
            ? await _simpleS3.uploadFile(
                faceFile!,
                Credentials.s3_bucketName,
                Credentials.s3_poolD,
                AWSRegions.apSouth1,
                debugLog: true,
                s3FolderPath: "test",
                accessControl: S3AccessControl.publicRead,
              )
            : null;

        setState(() {
          uploadedface = true;
          isLoadingface = false;
          faceFile != null ? mutation.saveProfile(result.toString()) : null;
          _uploadfront();
        });
      } catch (e) {
        print(e);
      }
    }
    return result;
  }

  Future<String?> _uploadfront() async {
    String? result;

    if (result == null) {
      try {
        setState(() {
          isLoadingfront = true;
        });
        result = frontFile != null
            ? await _simpleS3.uploadFile(
                frontFile!,
                Credentials.s3_bucketName,
                Credentials.s3_poolD,
                AWSRegions.apSouth1,
                debugLog: true,
                s3FolderPath: "test",
                accessControl: S3AccessControl.publicRead,
              )
            : null;

        setState(() {
          uploadedfront = true;
          isLoadingfront = false;
          frontFile != null ? mutation.frontProfile(result.toString()) : null;
          _uploadside();
        });
      } catch (e) {
        print(e);
      }
    }
    return result;
  }

  Future<String?> _uploadside() async {
    String? result;

    if (result == null) {
      try {
        setState(() {
          isLoadingside = true;
        });
        result = sideFile != null
            ? await _simpleS3.uploadFile(
                sideFile!,
                Credentials.s3_bucketName,
                Credentials.s3_poolD,
                AWSRegions.apSouth1,
                debugLog: true,
                s3FolderPath: "test",
                accessControl: S3AccessControl.publicRead,
              )
            : null;
        print("....,.., $result");
        setState(() {
          uploadedside = true;
          isLoadingside = false;
          sideFile != null ? mutation.sideProfile(result!) : null;
          _uploadback();
        });
      } catch (e) {
        print(e);
      }
    }
    return result;
  }

  Future<String?> _uploadback() async {
    String? result;

    if (result == null) {
      try {
        setState(() {
          isLoadingback = true;
        });
        result = backFile != null
            ? await _simpleS3.uploadFile(
                backFile!,
                Credentials.s3_bucketName,
                Credentials.s3_poolD,
                AWSRegions.apSouth1,
                debugLog: true,
                s3FolderPath: "test",
                accessControl: S3AccessControl.publicRead,
              )
            : null;

        setState(() {
          uploadedback = true;
          isLoadingback = false;
          backFile != null ? mutation.backProfile(result.toString()) : null;
        });
      } catch (e) {
        print(e);
      }
    }
    return result;
  }
}

Widget buildPhotoUpload(String title) {
  return Column(
    children: [
      Image.network(
        "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/upload.png",
        width: 80,
        height: 80,
      ),
      10.heightBox,
      title.text.white.make()
    ],
  );
}
