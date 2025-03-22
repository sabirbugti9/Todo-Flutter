import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';

class FilterTasks extends StatefulWidget {
  const FilterTasks({Key? key}) : super(key: key);

  @override
  State<FilterTasks> createState() => _FilterTasksState();
}

class _FilterTasksState extends State<FilterTasks> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterButton(
          label: "All",
          isSelected: selectedFilter == "All",
          onTap: () {
            setState(() {
              selectedFilter = "All";
              context.read<HomeCubit>().loadTasks(1);
            });
          },
        ),
        FilterButton(
          label: "InProgress",
          isSelected: selectedFilter == "InProgress",
          onTap: () {
            setState(() {
              selectedFilter = "InProgress";
              BlocProvider.of<HomeCubit>(context).filterTasks("inprogress");
            });
          },
        ),
        FilterButton(
          label: "Waiting",
          isSelected: selectedFilter == "Waiting",
          onTap: () {
            setState(() {
              selectedFilter = "Waiting";
              BlocProvider.of<HomeCubit>(context).filterTasks("waiting");
            });
          },
        ),
        FilterButton(
          label: "Finished",
          isSelected: selectedFilter == "Finished",
          onTap: () {
            setState(() {
              selectedFilter = "Finished";
              BlocProvider.of<HomeCubit>(context).filterTasks("finished");
            });
          },
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.dg),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0.dg, horizontal: 9.dg),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManger.primaryColor
                : ColorsManger.secondColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorsManger.mygrayColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
