import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentSuccessScreen extends StatefulWidget {
  const AppointmentSuccessScreen({super.key});

  @override
  _AppointmentSuccessScreenState createState() => _AppointmentSuccessScreenState();
}

class _AppointmentSuccessScreenState extends State<AppointmentSuccessScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _animation,
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              SizedBox(height: 20),
              ScaleTransition(
                scale: _animation,
                child: Text(
                  '¡Cita Registrada!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'Tu cita ha sido registrada exitosamente.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ScaleTransition(
                scale: _animation,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/main');
                  },
                  child: Text('Aceptar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}