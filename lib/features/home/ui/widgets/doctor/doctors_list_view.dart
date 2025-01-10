import '../../../data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorsModel?>? doctorDataList;
  // Contains the data for the doctors to be displayed.
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
        // Each item in the list is created using the DoctorListViewItem widget,
        // passing the corresponding doctor data from doctorDataList based on
        // the current index.
      ),
    );
  }
}
