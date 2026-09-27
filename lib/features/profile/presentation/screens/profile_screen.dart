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

  // متغير للتحكم في وضع التعديل (افتراضياً مغلق)
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    final authCubit = context.read<AuthCubit>();
    final user = authCubit.user;

    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _passwordController = TextEditingController(text: '');
    _phoneController = TextEditingController(text: '');
    _addressController = TextEditingController(text: '');
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
    final authCubit = context.read<AuthCubit>();
    final user = authCubit.user;
    final displayName = user?.name ?? _nameController.text;
    final displayEmail = user?.email ?? _emailController.text;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.s20.w,
          vertical: Insets.s16.h,
        ),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                logoutLoading: () => EasyLoading.show(
                  dismissOnTap: false,
                  maskType: EasyLoadingMaskType.black,
                ),
                logoutError: (messageError) async {
                  await EasyLoading.dismiss();
                  if (context.mounted) {
                    UiUtils.showMessage(context, messageError, isError: true);
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
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1️⃣ هيدر الملف الشخصي مع زر التبديل لوضع التعديل
                  _buildProfileHeader(
                    name: displayName,
                    email: displayEmail,
                    onEditPressed: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                  SizedBox(height: Insets.s24.h),

                  // 2️⃣ حقول البيانات الشخصية (تتأثر بـ _isEditing)
                  TextFormFieldEdit(
                    label: 'Your full name',
                    controller: _nameController,
                    readOnly: !_isEditing,
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
                    readOnly: !_isEditing,
                    prefixIcon: true,
                    icon: Icon(
                      Icons.email_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  SizedBox(height: Insets.s16.h),

                  TextFormFieldEdit(
                    label: 'Your password',
                    controller: _passwordController,
                    readOnly: !_isEditing,
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
                    readOnly: !_isEditing,
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
                    readOnly: !_isEditing,
                    prefixIcon: true,
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: ColorManager.primary,
                    ),
                  ),
                  SizedBox(height: Insets.s32.h),

                  // 3️⃣ زر التحديث (يظهر فقط في حالة التعديل _isEditing == true)
                  if (_isEditing) ...[
                    ElevatedButtonEdit(
                      title: 'Update Profile',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isEditing = false;
                          });
                          UiUtils.showMessage(
                            context,
                            isError: false,
                            'تم تحديث البيانات بنجاح',
                          );
                        }
                      },
                      backgroundColor: ColorManager.primary,
                      textColor: ColorManager.white,
                    ),
                    SizedBox(height: Insets.s16.h),
                  ],

                  // 4️⃣ زر تسجيل الخروج
                  // استبدل جزء حاوية زر تسجيل الخروج بالكود التالي:
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.error.withValues(
                        alpha: 0.05,
                      ), // تدرج خفيف ومريح جداً للعين
                      borderRadius: BorderRadius.circular(Sizes.s14.r),
                      border: Border.all(
                        color: ColorManager.error.withValues(
                          alpha: 0.15,
                        ), // إطار هادئ وخفيف
                        width: 1.w,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(Sizes.s14.r),
                        onTap: () {
                          context.read<AuthCubit>().logout();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Insets.s14.h,
                            horizontal: Insets.s16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Log out',
                                style: getMediumStyle(
                                  color: ColorManager.error,
                                  fontsize: FontSize.s14.sp,
                                ),
                              ),
                              SizedBox(width: Insets.s8.w),
                              Icon(
                                Icons.logout_rounded,
                                color: ColorManager.error,
                                size: Sizes.s18.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Insets.s32.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // 👤 هيدر الملف الشخصي مع زر التعديل
  Widget _buildProfileHeader({
    required String name,
    required String email,
    required VoidCallback onEditPressed,
  }) {
    String initials = 'EA';
    if (name.isNotEmpty) {
      List<String> nameParts = name.trim().split(' ');
      if (nameParts.length > 1) {
        initials = '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
      } else if (nameParts[0].isNotEmpty) {
        initials = nameParts[0][0].toUpperCase();
      }
    }

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
          CircleAvatar(
            radius: Sizes.s32.r,
            backgroundColor: ColorManager.primary,
            child: Text(
              initials,
              style: getBoldStyle(
                color: ColorManager.white,
                fontsize: FontSize.s20.sp,
              ),
            ),
          ),
          SizedBox(width: Insets.s18.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, $name',
                  style: getBoldStyle(
                    color: ColorManager.textPrimary,
                    fontsize: FontSize.s16.sp,
                  ),
                ),
                SizedBox(height: Insets.s4.h),
                Text(
                  email,
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
          // زر أيقونة التعديل
          IconButton(
            onPressed: onEditPressed,
            icon: Container(
              padding: EdgeInsets.all(Insets.s8.r),
              decoration: BoxDecoration(
                color: _isEditing
                    ? ColorManager.primary
                    : ColorManager.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isEditing ? Icons.close_rounded : Icons.edit_outlined,
                color: _isEditing ? ColorManager.white : ColorManager.primary,
                size: Sizes.s18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
