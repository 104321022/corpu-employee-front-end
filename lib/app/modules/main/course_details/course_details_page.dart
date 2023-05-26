import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';
import '../../../app.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({
    super.key,
    this.courseData,
  });

  final Map? courseData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDetailsCubit(
        context,
        courseData: courseData,
      ),
      child: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<CourseDetailsCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Course Details'),
            ),
            body: Stack(
              children: [
                if (courseData != null)
                  ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      Text(
                        courseData!['course_title'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Course Code: ${courseData!['course_code']}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Res.colors.materialColor,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (courseData!['description'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              courseData!['description'],
                            ),
                          ],
                        ),
                    ],
                  ),
                Visibility(
                  visible: state.loading,
                  child: const CupertinoAlertDialog(
                    title: CupertinoActivityIndicator(),
                    content: Text('Loading'),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(4.0),
              child: state.userType == 'Employee'
                  ? ElevatedButton(
                      onPressed: state.loading ? null : cubit.apply,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 48.0),
                      ),
                      child: const Text('Apply'),
                    )
                  : state.userType == 'Staff'
                      ? ElevatedButton(
                          onPressed: state.loading ? null : cubit.editDetails,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 48.0),
                          ),
                          child: const Text('Edit Details'),
                        )
                      : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
