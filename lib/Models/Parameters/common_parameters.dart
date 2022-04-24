import 'package:flutter/material.dart';
import 'package:social_x/Models/article_model.dart';

late TabController tabController;
bool termAndConditionAccepted = false;

String? userID;

var loginFormkey = GlobalKey<FormState>();
var signUpFormkey = GlobalKey<FormState>();
var passwordResetFormkey = GlobalKey<FormState>();

String? passWordError;
String? emailError;

TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();

TextEditingController passwordResetEmailController = TextEditingController();

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

ValueNotifier<List<ArticleModel>> articleModelListNotifier = ValueNotifier([]);
List<ArticleModel> searchResult = [];
