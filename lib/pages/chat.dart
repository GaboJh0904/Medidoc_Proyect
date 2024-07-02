import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ChatBot extends StatelessWidget {
  final String nombreDoctor;
  final int estado;

  ChatBot({required this.nombreDoctor, required this.estado});

  @override
  Widget build(BuildContext context) {
    return ChatScreen(
        nombreDoctor: nombreDoctor,
        estado: estado); // Pasamos las variables al ChatScreen
  }
}

class ChatScreen extends StatefulWidget {
  final String nombreDoctor;
  final int estado;

  ChatScreen({required this.nombreDoctor, required this.estado});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FlutterTts _flutterTts = FlutterTts();
  final List<String> messages = [];
  List<String> chatmessages = ['¿En qué puedo ayudarte?'];
  final TextEditingController _controller = TextEditingController();
  String chatbotResponse = '';

  // Para el SpeechToText
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "";

  late bool showZoomButton;
  late bool showMapsButton;

  final String apiUrl = "http://192.168.99.126:8001/gemini/question";

  @override
  void initState() {
    super.initState();
    initSpeech();
    _setButtonVisibility();
  }

  void _setButtonVisibility() {
    setState(() {
      if (widget.estado == 1) {
        showZoomButton = true;
        showMapsButton = false;
      } else if (widget.estado == 2) {
        showZoomButton = false;
        showMapsButton = true;
      } else if (widget.estado == 3) {
        showZoomButton = false;
        showMapsButton = false;
      }
    });
  }

  Future<void> sendData(question) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: '''
        {
            "question": "${question.toString()}"
        }
        ''',
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(response.body);
        setState(() {
          print("JSON");
          print(jsonResponse['response'].toString());
          chatbotResponse = jsonResponse['response'].toString();
          print("CHATBOT");
          print(chatbotResponse);

          chatmessages.add(chatbotResponse);
          _flutterTts.setSpeechRate(0.5);
          _flutterTts.speak(chatbotResponse);
          print("CHATMESs");
          print(chatmessages);
        });
      }
    } catch (e) {
      print("Excepción durante la solicitud: $e");
    }
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    if (_speechToText.isNotListening && _wordsSpoken.isNotEmpty) {
      setState(() {
        print("Mensaje enviado");
        messages.add(_wordsSpoken);
        sendData(_wordsSpoken);
        _flutterTts.setSpeechRate(0.5);
        _flutterTts.speak(chatbotResponse); // Speak chatbot message
        _wordsSpoken = "";
      });
    }
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    print("escuchando");
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = result.recognizedWords;
      print("Resultado $_wordsSpoken");
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text); // Add user message
        sendData(_controller.text);
        _controller.clear();
      });
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      print('Archivo seleccionado: ${file.name}');
      // Aquí puedes agregar la lógica para enviar el archivo al servidor o lo que necesites hacer con él
    } else {
      // Usuario canceló la selección de archivo
      print('Selección de archivo cancelada');
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF005954), // Color 1
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Esto llevará al usuario de vuelta a la página anterior
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 10),
            Text(widget.nombreDoctor, style: TextStyle(color: Colors.white)),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          if (showZoomButton)
            IconButton(
              icon: Icon(Icons.video_call, color: Colors.white),
              onPressed: () => _launchURL(
                  'zoommtg://'), // Ejemplo de URL de esquema para abrir Zoom
            ),
          if (showMapsButton)
            IconButton(
              icon: Icon(Icons.map, color: Colors.white),
              onPressed: () => _launchURL(
                  'https://maps.google.com'), // URL para abrir Google Maps
            ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Chatbot Messages
          Expanded(
            child: ListView.builder(
                itemCount: messages.length + chatmessages.length,
                itemBuilder: (context, index) {
                  if (index.isEven) {
                    final chatIndex = index ~/ 2;
                    return ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF338b85),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          chatmessages[chatIndex],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    final userIndex = (index - 1) ~/ 2;
                    return ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF5dc1b9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          messages[userIndex],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                }),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                  color:
                      _speechToText.isNotListening ? Colors.black : Colors.red,
                ),
                onPressed: _speechToText.isListening
                    ? _stopListening
                    : _startListening,
              ),
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: _pickFile,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Escribe un mensaje',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    //onSubmitted: (_) => _sendMessage(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
