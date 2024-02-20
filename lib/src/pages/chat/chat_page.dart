import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot Médico',
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatPage> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  bool firstMessageSent = false;

  // Respuestas aleatorias para cada enfermedad
  final Map<String, Map<String, List<String>>> _responses = {
    'gripe': {
      'Definición': [
        'La gripe es una enfermedad viral que afecta a las vías respiratorias. Suele presentarse con síntomas como fiebre, tos, dolor de garganta y fatiga.'
      ],
      'Causas': [
        'Virus de la gripe (virus de la influenza)',
        'Contagio por contacto con personas infectadas',
        'Inhalación de gotículas respiratorias infectadas',
        'Baja inmunidad',
      ],
      'Tratamiento': [
        'Reposo en cama',
        'Consumo abundante de líquidos',
        'Medicamentos antipiréticos para reducir la fiebre (paracetamol, ibuprofeno)',
        'Analgésicos para aliviar el dolor (ibuprofeno, acetaminofén)',
        'Antivirales (en casos graves o si se administran dentro de las 48 horas del inicio de los síntomas)',
      ],
      'Recomendación médica': [
        'Vacunarse anualmente contra la gripe',
        'Evitar el contacto cercano con personas enfermas',
        'Lavarse las manos con frecuencia',
        'Cubrirse la boca y la nariz al toser o estornudar',
        'Limpiar y desinfectar superficies y objetos que puedan estar contaminados',
      ],
    },
    'fiebre': {
      'Definición': [
        'La fiebre es una respuesta del cuerpo a una infección o enfermedad. Ayuda a combatir la infección aumentando la temperatura corporal.'
      ],
      'Causas': [
        'Infecciones virales (resfriado común, gripe)',
        'Infecciones bacterianas (infecciones del tracto urinario, neumonía)',
        'Inflamaciones (artritis, enfermedades autoinmunes)',
        'Reacciones a medicamentos',
        'Tumores',
      ],
      'Tratamiento': [
        'Descanso',
        'Hidratación adecuada',
        'Uso de medicamentos antipiréticos (paracetamol, ibuprofeno)',
        'Tratamiento dirigido a la causa subyacente (en caso de infección o inflamación)',
      ],
      'Recomendación médica': [
        'Consultar a un médico si la fiebre es alta (generalmente superior a 38.5°C), dura más de tres días o está asociada con otros síntomas preocupantes',
        'No automedicarse sin indicación médica',
        'Vestirse con ropa ligera y mantener una temperatura ambiente confortable',
        'Beber líquidos con regularidad para prevenir la deshidratación',
      ],
    },
    'farigintis': {
      'Definición': [
        'La faringitis es la inflamación de la faringe, generalmente causada por infecciones virales o bacterianas. Los síntomas incluyen dolor de garganta, dificultad para tragar y fiebre.'
      ],
      'Causas': [
        'Virus (como el virus de la gripe o el virus del resfriado común)',
        'Bacterias (como el estreptococo)',
        'Irritantes (humo, contaminantes)',
        'Alergias',
      ],
      'Tratamiento': [
        'Descanso vocal',
        'Consumo de líquidos tibios o fríos para aliviar la irritación',
        'Gárgaras con agua salada tibia',
        'Uso de analgésicos y antipiréticos (paracetamol, ibuprofeno)',
        'Antibióticos (en casos de faringitis bacteriana)',
      ],
      'Recomendación médica': [
        'Evitar el humo de tabaco y otros irritantes',
        'Descansar la voz y evitar hablar en voz alta o gritar',
        'Evitar el contacto cercano con personas enfermas',
        'Consultar a un médico si los síntomas persisten por más de una semana o si son severos',
      ],
    },
    'dolor de estomago': {
      'Definición': [
        'El dolor de estómago puede tener muchas causas, incluyendo indigestión, gases, infecciones, úlceras o problemas más graves como apendicitis.'
      ],
      'Causas': [
        'Indigestión',
        'Gastritis',
        'Reflujo gastroesofágico',
        'Infecciones estomacales (gastroenteritis)',
        'Úlceras pépticas',
        'Cálculos biliares',
        'Pancreatitis',
      ],
      'Tratamiento': [
        'Dieta blanda',
        'Evitar alimentos que irriten el estómago (alimentos picantes, grasos, ácidos)',
        'Medicamentos para reducir la acidez estomacal (antiácidos, inhibidores de la bomba de protones)',
        'Antibióticos (en casos de infección bacteriana)',
        'Cirugía (en casos graves como apendicitis o úlceras complicadas)',
      ],
      'Recomendación médica': [
        'Mantener una dieta saludable y equilibrada',
        'Comer porciones pequeñas y masticar lentamente',
        'Evitar acostarse inmediatamente después de comer',
        'Consultar a un médico si el dolor es severo, persistente o se acompaña de otros síntomas preocupantes',
      ],
    },
  };

  final Map<String, String> _currentContext = {};

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
      _handleAutoResponse(text);
    });
  }

  void _handleAutoResponse(String text) {
    String response;
    if (!firstMessageSent) {
      response = 'Hola, ¿cómo estás?';
      firstMessageSent = true;
    } else if (text.toLowerCase().contains('gracias')) {
      response = 'De nada, Estamos aquí para ayudarte!';
    } else {
      response = _getResponseInContext(text);
      if (response.isEmpty) {
        response = _getRandomResponseForSymptoms(text);
        if (response.isNotEmpty) {
          _currentContext['disease'] = _getCurrentDisease(text);
        }
      }
      if (response.isEmpty) {
        response = 'Disculpe, no entiendo. ¿Puede ser más claro, por favor?';
      }
    }
    _addAutoResponse(response);
  }

  String _getResponseInContext(String text) {
    final disease = _currentContext['disease'];
    if (disease != null) {
      final responses = _responses[disease]!;
      final List<String> categories = responses.keys.toList();
      for (String category in categories) {
        if (text.toLowerCase().contains(category.toLowerCase())) {
          final selectedResponses = responses[category]!;
          if (category.toLowerCase() == 'definición') {
            return selectedResponses.first;
          } else {
            return selectedResponses.join('\n- ');
          }
        }
      }
    }
    return '';
  }

  String _getCurrentDisease(String text) {
    for (String key in _responses.keys) {
      if (text.toLowerCase().contains(key)) {
        return key;
      }
    }
    return '';
  }

  String _getRandomResponseForSymptoms(String text) {
    text = text.toLowerCase();
    for (String key in _responses.keys) {
      if (text.contains(key)) {
        final random = Random();
        final enfermedad = key.toUpperCase();
        final responses = _responses[key]!;
        final categories = responses.keys.toList();
        String formattedResponse = '**$enfermedad**\n\n';
        for (String category in categories) {
          final selectedResponses = responses[category]!;
          final randomResponseIndex = random.nextInt(selectedResponses.length);
          formattedResponse += '$category:\n- ${selectedResponses[randomResponseIndex]}\n\n';
        }
        return formattedResponse;
      }
    }
    return '';
  }

  void _addAutoResponse(String text) {
    ChatMessage autoResponse = ChatMessage(
      text: text,
      isAutoResponse: true,
    );
    _messages.insert(0, autoResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAT BOT MÉDICO'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isAutoResponse;

  ChatMessage({required this.text, this.isAutoResponse = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text('G'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isAutoResponse
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Geraldine',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isAutoResponse ? Colors.green : null,
                      fontWeight: isAutoResponse ? FontWeight.bold : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
