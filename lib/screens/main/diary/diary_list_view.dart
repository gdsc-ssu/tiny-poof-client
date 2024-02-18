import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/core/util/date_format.dart';
import 'package:tiny_poof/screens/main/diary/diary_view_model.dart';

class DiaryListView extends StatelessWidget {
  const DiaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DiaryViewModel.instance,
      isResetState: false,
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${viewModel.user?.name ?? "기쁨"}이의 일기",
            style: FontSystem.initTextStyle,
          ),
        ),
        body: ListView.separated(
          itemCount: viewModel.diaryList.length,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            final diary = viewModel.diaryList[index];
            return _DiaryCard(
              content: diary.content,
              date: dateFormatA(diary.date),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}

class _DiaryCard extends StatelessWidget {
  final String content;
  final String date;

  const _DiaryCard({
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorSystem.main3,
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: const TextStyle(
              fontFamily: "Pretendard",
              fontSize: 18,
              color: Color(0xFF431919),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(
              fontFamily: "Pretendard",
              fontSize: 16,
              color: Color(0xFF858480),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
