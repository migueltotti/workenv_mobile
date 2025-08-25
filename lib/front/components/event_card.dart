import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/domain/value_objects/event_status_icons.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.eventCardTitle,
    required this.eventCardDescription,
    required this.eventCardDate,
    required this.eventCardTime,
    required numberOfParticipants,
    required this.eventStatus,
  }) : _numberOfParticipants = numberOfParticipants;

  final String eventCardTitle;
  final String eventCardDescription;
  final String eventCardDate;
  final String eventCardTime;
  final int _numberOfParticipants;
  final String eventStatus;
  EventStatusIcons get _eventStatusIcons =>
      EventStatusIcons.getIconByStatus(eventStatus);

  List<Widget> _buildIconsFromEstimate() {
    List<Widget> icons = [];

    if (_numberOfParticipants > 0) {
      icons.add(
        Positioned(
          right: 0,
          top: 0,
          child: Icon(
            Icons.account_circle_rounded,
            color: Color.fromRGBO(42, 74, 245, 1),
            size: 20,
          ),
        ),
      );
      icons.add(
        Positioned(
          right: 0,
          top: 0,
          child: Icon(Icons.circle, color: Colors.white, size: 20),
        ),
      );
    }

    if (_numberOfParticipants > 11) {
      icons.add(
        Positioned(
          right: 8,
          top: 0,
          child: Icon(
            Icons.account_circle_rounded,
            color: Color.fromRGBO(42, 74, 245, 0.75),
            size: 20,
          ),
        ),
      );
      icons.add(
        Positioned(
          right: 8,
          top: 0,
          child: Icon(Icons.circle, color: Colors.white, size: 20),
        ),
      );
    }

    if (_numberOfParticipants > 21) {
      icons.add(
        Positioned(
          right: 16,
          top: 0,
          child: Icon(
            Icons.account_circle_rounded,
            color: Color.fromRGBO(42, 74, 245, 0.5),
            size: 20,
          ),
        ),
      );
      icons.add(
        Positioned(
          right: 16,
          top: 0,
          child: Icon(Icons.circle, color: Colors.white, size: 20),
        ),
      );
    }

    var reversedIcons = icons.reversed.toList();

    if (_numberOfParticipants > 31) {
      reversedIcons.add(
        Positioned(
          right: 33,
          top: 5,
          child: Text(
            '...',
            style: GoogleFonts.inter(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return reversedIcons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: 170,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Color.fromRGBO(115, 29, 252, 0.15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventCardTitle,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.lock_outline_rounded,
                color: Color.fromRGBO(0, 0, 0, 0.75),
                size: 16,
              ),
            ],
          ),
          Text(
            eventCardDescription,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1,
                children: [
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Icon(
                          _eventStatusIcons.icon,
                          color: _eventStatusIcons.color,
                          size: 18,
                        ),
                        Text(
                          eventCardDate,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    eventCardTime,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                width: 45,
                height: 35,
                child: Stack(
                  alignment: Alignment.center,
                  children: _buildIconsFromEstimate(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 160,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(13, 27, 52, 0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text(
                'See more',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
