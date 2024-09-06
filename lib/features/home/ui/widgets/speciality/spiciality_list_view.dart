import 'package:docspot/features/home/logic/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/specializations_response_model.dart';
import 'spiciality_listview_item.dart';

class SpicialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsResponseModelDataList;

  const SpicialityListView({
    super.key,
    required this.specializationsResponseModelDataList,
  });

  @override
  State<SpicialityListView> createState() => _SpicialityListViewState();
}

class _SpicialityListViewState extends State<SpicialityListView> {
  int selectedIndexNumber = 0;
  // Maintains a variable selectedIndexNumber to track which specialization
  // is currently selected.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // SizedBox: A widget that forces a child to have a specific size.
      height: 100.h,
      // Here,it's setting a fixed height of 100.h units, adapted to the
      // screen size using flutter_screenutil.
      child: ListView.builder(
        // ListView.builder: A constructor that creates a scrollable list of
        // widgets. It's efficient for large lists because it builds only the
        // widgets visible on the screen.
        scrollDirection: Axis.horizontal,
        // scrollDirection: Axis.horizontal: Specifies the scroll direction
        // as horizontal.
        itemCount: widget.specializationsResponseModelDataList.length,
        // itemCount: 7: The number of items to display in the list.
        itemBuilder: (context, index) {
          // itemBuilder: A callback function that provides the widgets for
          // each item in the list. It takes context and index as arguments.
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndexNumber = index;
                // Updates the selectedIndexNumber to highlight the tapped specialization.
              });
              context.read<HomeCubit>().getDoctorsList(
                    spicializationId: widget
                            .specializationsResponseModelDataList[index]?.id ??
                        0,
                    // Tries to access the item at the specified index in
                    // the list specializationsResponseModelDataList .
                  );
            },
            child: SpicialityListViewItem(
              specializationsResponseModelDataList:
                  widget.specializationsResponseModelDataList[index],
              itemIndex: index,
              selectedIndexNumber: selectedIndexNumber,
            ),
          );
        },
      ),
    );
  }
}
