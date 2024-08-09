import 'package:docspot/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorsModel?>? doctorDataList;
  const DoctorsListView({super.key, this.doctorDataList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // This widget expands to fill the available space along the main axis
      // (horizontal or vertical) within its parent widget. It allows the
      // ListView.builder to take up the remaining space after other widgets
      // have been laid out.
      child: ListView.builder(
        // A ListView constructor that builds children on demand. This is useful
        // for long lists where the number of children might not be known or is dynamic.
        itemCount: doctorDataList?.length,
        itemBuilder: (context, index) {
          return DoctorListViewItem(
            doctorDataList: doctorDataList?[index],
          );
        },
      ),
    );
  }
}
