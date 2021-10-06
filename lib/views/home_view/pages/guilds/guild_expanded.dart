import 'package:flutter/material.dart';

class Message {
  String message;
  bool fromMe;

  Message({required this.message, required this.fromMe});
}

class GuildExpandedView extends StatefulWidget {
  final String name;
  final String id;

  const GuildExpandedView({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  _GuildExpandedViewState createState() => _GuildExpandedViewState();
}

class _GuildExpandedViewState extends State<GuildExpandedView> {
  List<Message> messages = [
    Message(message: "hai", fromMe: false),
    Message(message: "hiiiii", fromMe: true),
    Message(message: "What's up", fromMe: false),
  ];
  final TextEditingController _messageEditingController =
      TextEditingController();
  bool isValidMessage = false;

  void sendMessage(String message) {
    setState(() {
      messages.add(Message(message: message, fromMe: true));
    });
    _messageEditingController.clear();
    isValidMessage = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF313131), Color(0xFF282828)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            AppBar(
              title: Text(widget.name),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //placeholder
                      children: messages
                          .map((e) => Row(
                                mainAxisAlignment: e.fromMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: e.fromMe
                                          ? Color(0xFF6ECD95)
                                          : Colors.white,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e.message,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.apply(
                                                  color: Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              elevation: 10.0,
              child: Container(
                color: Color(0xFF282828),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              // onSubmitted: sendMessage,
                              onChanged: (message) {
                                if (messages.length > 0) {
                                  setState(() => isValidMessage = true);
                                } else {
                                  setState(() => isValidMessage = false);
                                }
                              },
                              controller: _messageEditingController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 8.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusColor: Colors.transparent,
                                hintText: "Message",
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send_outlined),
                        onPressed: isValidMessage
                            ? () => sendMessage(_messageEditingController.text)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}