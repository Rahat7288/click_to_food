import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_themes/app_colors.dart';
import '../../constants/text/text_style.dart';

///Custom app drawer for home screen appBar.
Widget appDrawer({required BuildContext context}) => Container(
      color: AppColor.backGroundColor,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //height: 300,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColor.borderColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                // CircleAvatar(
                //   radius: 70,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(100),
                //     child: CachedNetworkImage(
                //         imageUrl:
                //             'https://banner2.cleanpng.com/20180404/sqe/avhxkafxo.webp'),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Rahat Islam Akash',
                  style: TStyle.subTitle(
                    color: AppColor.titleTextColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColor.borderColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                ///Custom Button for my product body on home screen
                ///state managed by homeScreenCubit (features/home_screen/view_models/home_screen_cubit/home_screen_cubit.dart)
                // wideButton(
                //   press: () {
                //     context.read<HomeScreenCubit>().toggleToMyProduct();
                //   },
                //   width: MediaQuery.of(context).size.width,
                //   buttonName: 'My Products',
                //   backgroundColor: AppColor.primaryButtonColor,
                //   forgroundColor: AppColor.buttonTextColor,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                // ///Custom Button for all product body on home screen
                // ///state managed by homeScreenCubit (features/home_screen/view_models/home_screen_cubit/home_screen_cubit.dart)
                // wideButton(
                //   press: () {
                //     context.read<HomeScreenCubit>().toggleToAllProduct();
                //   },
                //   width: MediaQuery.of(context).size.width,
                //   buttonName: 'All Products',
                //   backgroundColor: AppColor.primaryButtonColor,
                //   forgroundColor: AppColor.buttonTextColor,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                // ///custom button to navigate user on my cart screen
                // wideButton(
                //   press: () {
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) => MyCart()));
                //   },
                //   width: MediaQuery.of(context).size.width,
                //   buttonName: 'My Cart',
                //   backgroundColor: AppColor.primaryButtonColor,
                //   forgroundColor: AppColor.buttonTextColor,
                // ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),

          ///Custom button for user logout
          ///state managed by AuthCubit
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: wideButton(
          //     press: () {
          //       Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => LogInScreen()));
          //     },
          //     buttonName: 'Logout',
          //     backgroundColor: AppColor.redButtonColor,
          //     forgroundColor: AppColor.buttonTextColor,
          //   ),
          // )
        ],
      ),
    );
