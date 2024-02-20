import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:posta_medica_huancayo/src/pages/date/date_controller.dart';
class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DatePage> {
  DateController controller = Get.put(DateController());
  final List<String> opciones = ['Medicina General', 'Obstetricia', 'Enfermería', 'Psicología', 'Odontológia', 'Oncologia', 'Pediatria'];
  var selectedval = "Medicina General";
  var fechahora = null;
  String textoFecha = "SIN FECHA ASIGNADA";
  showDatePicker() async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
      DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Disable 25th Feb 2023
        if (dateTime == DateTime(2023, 2, 25)) {
          return false;
        } else {
          return true;
        }
      },
    );
    setState(() {
      fechahora = dateTime;
      textoFecha = fechahora.toString();
    });

  }

  showDateTimeRangePicker() async{
    List<DateTime>? dateTimeList =
    await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: DateTime.now(),
      startFirstDate:
      DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      endInitialDate: DateTime.now(),
      endFirstDate:
      DateTime(1600).subtract(const Duration(days: 3652)),
      endLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Disable 25th Feb 2023
        if (dateTime == DateTime(2023, 2, 25)) {
          return false;
        } else {
          return true;
        }
      },
    );
    print(dateTimeList);
  }


  List<String> items = [];
  @override
  void initState() {
    super.initState();
    cargarDatosAsync();
  }
  Future<void> cargarDatosAsync() async {
    // Llamar a la función asíncrona y manejar el resultado
    List<String> listaObtenida = await controller.showDates();
    setState(() {
      items = listaObtenida;
    });
  }
  void refreshDate() async {
    // Llamar a la función asíncrona y manejar el resultado
    List<String> listaObtenida = await controller.showDates();
    setState(() {
      items = listaObtenida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas Medicas'),
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.7,child: ElevatedButton(onPressed: () {showDatePicker();}, child: Text('Elegir Fecha de la Cita'))),
                Text(textoFecha),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: selectedval,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedval = newValue!;
                    });
                  },
                  items: opciones.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                     controller.createDate(selectedval,textoFecha);

                    });

                  }, child: Text('Guardar Cita')),
                ),
                SizedBox(height: 20),
                Text('LISTADO DE CITAS MEDICAS'),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Bordes negros
                        ),
                        child: ListTile(
                          title: Text(items[index]),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
