import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcManagerService {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final _nfcManager = NfcManager.instance;

  // Future<bool> _isAvailable() async =>
  //   await _nfcManager.isAvailable();

  // Future<bool> _tagRead() async {
  //   try {
  //     if (!await _isAvailable()) return false;

  //     return await _nfcManager.startSession(onDiscovered: onDiscovered)
  //   }
  // }
}
