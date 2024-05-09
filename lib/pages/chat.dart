import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nombre Medico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FlutterTts _flutterTts = FlutterTts();
  final List<String> messages = [];
  List<String> chatmessages = ['¿En que puedo ayudarte?'];
  final TextEditingController _controller = TextEditingController();
  String chatbotResponse = '';

  // Para el SpeechToText
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "";

  final String apiUrl = "http://192.168.99.126:8001/gemini/question";

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

  @override
  void initState() {
    super.initState();
    initSpeech();
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
        //String chatbotResponse = "Gracias por tu mensaje";
        //chatmessages.add(chatbotResponse);
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

      //String chatbotResponse = "Ya funcionaaaaa";
      //chatmessages.add(chatbotResponse); // Add chatbot message
      // _flutterTts.speak(chatbotResponse); // Speak chatbot message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Financiero'),
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
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)),
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
                          color: Colors.blue,
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
