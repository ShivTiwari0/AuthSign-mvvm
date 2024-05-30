import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/view/signup_screen/signup_screen4.dart';
import 'package:softlab_project/viewmodel/registration_viewmodel.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3({super.key});

  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  String? _fileName;
  Uint8List? _image;
  File? selectedImage;

  Future<void> _pickFileFromGallery() async {
    try {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (result != null) {
        setState(() {
          _fileName = result.name;
          selectedImage = File(result.path);
          _image = selectedImage!.readAsBytesSync();
        });
      } else {
        setState(() {
          _fileName = 'No image selected';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickFileFromCamera() async {
    try {
      final result = await ImagePicker().pickImage(source: ImageSource.camera);
      if (result != null) {
        setState(() {
          _fileName = result.name;
          selectedImage = File(result.path);
          _image = selectedImage!.readAsBytesSync();
        });
      } else {
        setState(() {
          _fileName = 'No image selected';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: pred.withOpacity(0.3),
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: width(context, 1),
            height: height(context, 1 / 4.5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _pickFileFromGallery();
                        },
                        child: const Icon(
                          Icons.image,
                          size: 70,
                        ),
                      ),
                      const Text('Gallery')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _pickFileFromCamera();
                        },
                        child: const Icon(
                          Icons.camera,
                          size: 70,
                        ),
                      ),
                      const Text('Camera')
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _clearSelectedFile() {
    setState(() {
      _fileName = null;
      _image = null;
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationViewModel>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 7.0, top: 20, right: 8),
          child: Text(
            'FarmerEats',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context, 0.04),
              ),
              const Text(
                ' SignUp 3 of 4',
                style: TextStyle(color: textColorGrey),
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              20.height,
              const Text(
                'Attached proof of Department of Agriculture \nregistrations i.e. Florida Fresh, USDA Approved,\nUSDA Organic',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textColorGrey),
              ),
              SizedBox(height: height(context, 0.05)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Attach proof of registration',
                    style: TextStyle(color: blackColor, fontSize: 14),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: pred,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () => showImagePickerOption(context),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: textColorwhite,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(context, 0.04),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: width(context, 0.8),
                  padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _fileName != null
                            ? Text(
                                'Selected file: $_fileName',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: blackColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : const Text(
                                'No selected Image',
                                style: TextStyle(
                                    fontSize: 14, color: textColorGrey),
                              ),
                      ),
                      if (_fileName != null)
                        InkWell(
                          onTap: _clearSelectedFile,
                          child: const Icon(
                            Icons.cancel,
                            color: textColorGrey,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height(context, 0.35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  CustomButton(
                    onPressed: () {
                      if (_fileName != null && selectedImage != null) {
                        provider.updateRegistrationProof(_fileName!);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen4()));
                    },
                    width: width(context, 0.55),
                    height: height(context, 0.07),
                    backgroundColor: pred,
                    text: 'Continue',
                    borderRadius: BorderRadius.circular(30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
