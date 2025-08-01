import 'package:flutter/material.dart';

class EventStatusIcons {
  final IconData icon;
  final Color color;

  const EventStatusIcons({required this.icon, required this.color});

  static const Map<String, EventStatusIcons> _statusIcons = {
    'active': EventStatusIcons(
      icon: Icons.circle_notifications_rounded,
      color: Color.fromRGBO(112, 212, 230, 48),
    ),
    'scheduled': EventStatusIcons(
      icon: Icons.calendar_month_rounded,
      color: Color.fromRGBO(138, 72, 224, 100),
    ),
    'finished': EventStatusIcons(
      icon: Icons.check_circle_outline_rounded,
      color: Color.fromRGBO(74, 166, 240, 1),
    ),
    'expired': EventStatusIcons(
      icon: Icons.event_busy_rounded,
      color: Color.fromRGBO(255, 202, 75, 1),
    ),
    'cancelled': EventStatusIcons(
      icon: Icons.cancel_rounded,
      color: Color.fromRGBO(234, 67, 53, 1),
    ),
  };

  static EventStatusIcons getIconByStatus(String status) {
    return _statusIcons[status] ??
        const EventStatusIcons(
          icon: Icons.help_outline_rounded,
          color: Colors.grey,
    );
  }
}
