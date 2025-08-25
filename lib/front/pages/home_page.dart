import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/front/components/event_card.dart';
import 'package:work_env_mobile/front/components/task_card.dart';
import 'package:work_env_mobile/front/components/today_summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasNotifications = true;

  bool isFirstTaskCompleted = false;

  Widget indicateNotifications() {
    return hasNotifications
        ? Positioned(
          right: 12,
          top: 11,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Color.fromRGBO(74, 166, 240, 1),
              shape: BoxShape.circle,
            ),
          ),
        )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 70,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 166, 240, 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Icon(
                      Icons.person_outline,
                      color: Color.fromRGBO(13, 27, 52, 1),
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi,',
                            style: GoogleFonts.inter(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Miguel Totti',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: Color.fromRGBO(13, 27, 52, 1),
                              size: 25,
                            ),
                          ),
                          indicateNotifications(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListView(
                children: [
                  Text(
                    'Your day in focus',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  TodaySummaryCard(
                    title: '3 Tasks for today',
                    icon: Icon(
                      Icons.check,
                      color: Color.fromRGBO(74, 166, 240, 1),
                      size: 25,
                    ),
                  ),
                  SizedBox(height: 9),
                  TodaySummaryCard(
                    title: '1 event scheduled',
                    icon: Icon(
                      Icons.calendar_month_rounded,
                      color: Color.fromRGBO(115, 29, 252, 1),
                      size: 26,
                    ),
                  ),
                  SizedBox(height: 9),
                  TodaySummaryCard(
                    title: '2 tasks expired',
                    icon: Icon(
                      Icons.warning_amber_rounded,
                      color: Color.fromRGBO(255, 202, 75, 1),
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your tasks',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'view all',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 166, 240, 0.25),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        children: [
                          TaskListTile(
                            taskTitle: 'Fix scroll bug',
                            taskDescription:
                                'fix scroll bug on workenv page...',
                            taskDate: '26/06/25',
                            taskTime: '19:00',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 1,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          TaskListTile(
                            taskTitle: 'Email sender',
                            taskDescription:
                                'Implement email sending functionality...',
                            taskDate: '27/06/25',
                            taskTime: '08:00',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                            child: Container(
                              height: 1,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          TaskListTile(
                            taskTitle: 'Cook',
                            taskDescription: 'make carrot cake...',
                            taskDate: '01/07/25',
                            taskTime: '15:00',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your events',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'view all',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 6,
                      children: [
                        EventCard(
                          eventCardTitle: 'Hackaton',
                          eventCardDescription: 'Project development event...',
                          eventCardDate: '12/10/25',
                          eventCardTime: '19:00 - 22:00',
                          numberOfParticipants: 50,
                          eventStatus: 'scheduled',
                        ),
                        EventCard(
                          eventCardTitle: 'Party',
                          eventCardDescription:
                              'girlfriend`s birthday party!!!',
                          eventCardDate: '15/07/25',
                          eventCardTime: '19:00 - 02:00',
                          numberOfParticipants: 30,
                          eventStatus: 'active',
                        ),
                        EventCard(
                          eventCardTitle: 'Vacation',
                          eventCardDescription: 'Beach getaway with friends!',
                          eventCardDate: '20/07/25',
                          eventCardTime: '10:00',
                          numberOfParticipants: 10,
                          eventStatus: 'active',
                        ),
                        EventCard(
                          eventCardTitle: 'Classes',
                          eventCardDescription:
                              'Online classes for Flutter development',
                          eventCardDate: '25/07/25',
                          eventCardTime: '10:00',
                          numberOfParticipants: 19,
                          eventStatus: 'cancelled',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
