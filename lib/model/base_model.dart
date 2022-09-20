import 'package:flutter/material.dart';

@immutable
abstract class BaseModel {
  @override
  int get hashCode;

  @override
  bool operator ==(dynamic other);
}
