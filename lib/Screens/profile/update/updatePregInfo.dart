import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/services/databaseService.dart';

class UpdatePregInfo extends StatefulWidget {
  User currentUser = User();
  UpdatePregInfo(this.currentUser);
  @override
  _UpdatePregInfoState createState() => _UpdatePregInfoState();
}

class _UpdatePregInfoState extends State<UpdatePregInfo> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService _databaseService = DatabaseService();
  DateTime currentDueDate;
  DateTime lastPeriodDate;
  DateTime pickedDate;
  bool _isDateSelect = false;
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    currentDueDate = this.widget.currentUser.dueDate;
    lastPeriodDate = this.widget.currentUser.lastPeriodDate;
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.lightGreen[50],
      content: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Pregnancy Calculation",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 25.0),
              InkWell(
                onTap: () {
                  setState(() {
                    _pickDate(context, this.currentDueDate, this.lastPeriodDate);
                  });
                },
                child: Container(
                  height: 55.0,
                  width: double.infinity,
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                      color: Colors.green[50],
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              () {
                                if (!_isDateSelect) {
                                  return currentDueDate.year.toString() +
                                      " - " +
                                      currentDueDate.month.toString() +
                                      " - " +
                                      currentDueDate.day.toString();
                                } else {
                                  return pickedDate.year.toString() +
                                      " - " +
                                      pickedDate.month.toString() +
                                      " - " +
                                      pickedDate.day.toString();
                                }
                              }(),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                _errorText,
                style: TextStyle(fontSize: 11.5, color: Colors.red[700]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red[400].withOpacity(0.9),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.green[400],
                      textColor: Colors.white,
                      splashColor: Colors.green[400],
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        if (pickedDate == null) {
                          setState(() {
                            _errorText = 'Please enter valid Date';
                          });
                        } else {
                          this.widget.currentUser.dueDate = this.pickedDate;
                          this._databaseService.createUser(this.widget.currentUser);

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _pickDate(
      BuildContext context, DateTime curretnDueDate, DateTime lastPeriodDate) async {
    DateTime _date = await showDatePicker(
      context: context,
      initialDate: curretnDueDate,
      firstDate: DateTime(curretnDueDate.year, currentDueDate.month - 2, currentDueDate.day),
      lastDate: DateTime(curretnDueDate.year, currentDueDate.month + 1, currentDueDate.day),
    );

    if (_date != null) {
      setState(() {
        _isDateSelect = true;
        _errorText = '';
        pickedDate = (_date.toUtc().toLocal());
      });
    }
  }
}
