import 'package:flutter/material.dart';
import "../Util/GoogleSignIn.dart";

import "./ChatMessageContainer.dart";


class ChatScreen extends StatefulWidget{

  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  bool _isComposing = false;
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding:false,
        body: new Container(
        child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),

          new Container(
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildTextComposer(){
    return new IconTheme(
      data: new IconThemeData(
          color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 8.0),
                child: new IconButton(
                  icon: new Icon(Icons.photo_camera),
                  onPressed: null,
                ),
              ),
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String text){
                    setState((){
                      _isComposing = text.length >0;
                    });
                  },
                  onSubmitted: null,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Send a message"
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _handleSubmited,
                ),
              )
            ],
          )
      ),
    );
  }

  _handleSubmited()  {
    setState(() {
      _isComposing = false;
    });
    _sendMessage(googleSignIn.currentUser.displayName,this._textController.text);
    _textController.clear();

  }

  void _sendMessage( String nome, String text ) {
    ChatMessage message = new ChatMessage(
        nome,
        text,
        new AnimationController(
            vsync: this,
            duration: new Duration(milliseconds: 300)
        ));
    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }
}




