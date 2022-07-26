import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

final dateCtl = TextEditingController();
DateTime selectedDate = DateTime.now();

class TodoFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedDate;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    this.date = '22 Sept,2022',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onChangedDate,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  DateTime initDate;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 16),
            buildDate(context),
            SizedBox(height: 16),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        onChanged: widget.onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: widget.description,
        onChanged: widget.onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description [OPTIONAL]',
        ),
      );

  Widget buildDate(BuildContext context) {
    return DateTimePicker(
      initialValue: widget.date,
      onSaved: widget.onChangedDate,
      onChanged: widget.onChangedDate,
      type: DateTimePickerType.dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: initDate,
      dateLabelText: 'Select Date',
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
    );
  }

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: widget.onSavedTodo,
          child: Text('Save'),
        ),
      );
}
