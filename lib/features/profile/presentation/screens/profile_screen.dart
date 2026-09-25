import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/elevated_button_edit.dart';
import 'package:ecommerce/core/widgets/text_form_field_edit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Ehab Elish');
    _emailController = TextEditingController(text: 'ehab@gmail.com');
    _passwordController = TextEditingController(text: 'Ehab123@');
    _phoneController = TextEditingController(text: '01212357118');
    _addressController = TextEditingController(text: 'Beba, Beni Suef');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s20.w,
          vertical: Insets.s16.h,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1️⃣ هيدر الملف الشخصي (Profile Avatar & Info Header) بتصميم راقي
              _buildProfileHeader(),
              SizedBox(height: Insets.s24.h),

              // 2️⃣ حقول البيانات الشخصية (User Details Form)
              TextFormFieldEdit(
                label: 'Your full name',
                controller: _nameController,
                prefixIcon: true,
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: Insets.s16.h),

              TextFormFieldEdit(
                label: 'Your E-mail',
                controller: _emailController,
                prefixIcon: true,
                icon: Icon(Icons.email_outlined, color: ColorManager.primary),
              ),
              SizedBox(height: Insets.s16.h),

              TextFormFieldEdit(
                label: 'Your password',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: true,
                icon: Icon(
                  Icons.lock_outline_rounded,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: Insets.s16.h),

              TextFormFieldEdit(
                label: 'Your mobile number',
                controller: _phoneController,
                prefixIcon: true,
                icon: Icon(
                  Icons.phone_android_outlined,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: Insets.s16.h),

              TextFormFieldEdit(
                label: 'Your Address',
                controller: _addressController,
                prefixIcon: true,
                icon: Icon(
                  Icons.location_on_outlined,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: Insets.s32.h),

              // 3️⃣ زر تسجيل الخروج (Logout Action)
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.whenOrNull(
                    logoutLoading: () => EasyLoading.show(
                      dismissOnTap: false,
                      maskType: EasyLoadingMaskType.black,
                    ),
                    logoutError: (messageError) async {
                      await EasyLoading.dismiss();
                      if (context.mounted) {
                        UiUtils.showMessage(context, messageError);
                      }
                    },
                    logoutSuccess: () async {
                      await EasyLoading.dismiss();
                      if (context.mounted) {
                        context.go(Routes.login);
                      }
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.s16.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.error.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButtonEdit(
                    title: 'Logout',
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    backgroundColor: ColorManager.error.withValues(alpha: 0.08),
                    textColor: ColorManager.error,
                  ),
                ),
              ),
              SizedBox(height: Insets.s32.h),
            ],
          ),
        ),
      ),
    );
  }

  // 👤 ويدجيت هيدر المستخدم بصورة شخصية تفاعلية بستايل Minimal Luxury
  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(Insets.s20.r),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(Sizes.s24.r),
        border: Border.all(
          color: ColorManager.primary.withValues(alpha: 0.1),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // الصورة الشخصية مع زر التعديل المضيء
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: Sizes.s32.r,
                  backgroundColor: ColorManager.primary,
                  child: Text(
                    'EE',
                    style: getBoldStyle(
                      color: ColorManager.white,
                      fontsize: FontSize.s20.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(Insets.s4.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.white,
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.2),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.black.withValues(alpha: 0.08),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: Sizes.s12.sp,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: Insets.s18.w),

          // الاسم والبريد بتنسيق متناسق
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Ehab Elish',
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s16.sp,
                  ),
                ),
                SizedBox(height: Insets.s4.h),
                Text(
                  'ehab@gmail.com',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                    color: ColorManager.grey,
                    fontsize: FontSize.s13.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
