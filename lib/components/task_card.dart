import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskDate,
    required this.taskTime,
  });

  final String taskTitle;
  final String taskDescription;
  final String taskDate;
  final String taskTime;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool isFirstTaskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            isFirstTaskCompleted
                ? Icons.check_circle_rounded
                : Icons.circle_outlined,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              isFirstTaskCompleted = !isFirstTaskCompleted;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(5, 0, 15, 0),
        title: Text(
          widget.taskTitle,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          widget.taskDescription,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.taskDate,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
              ),
            ),
            Text(
              widget.taskTime,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
