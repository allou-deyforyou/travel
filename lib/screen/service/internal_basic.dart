import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '_service.dart';

Future<void> runService(Service service) {
  WidgetsFlutterBinding.ensureInitialized();
  return Future.wait([Service._setCertificates(), service._initialize()]);
}

abstract class Service {
  const Service();

  Future<void> _initialize();

  static Future<void> _setCertificates() async {
    final data = await rootBundle.load('assets/files/lets-encrypt-r3.pem');
    SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  }
}

class DevelopmentService extends Service {
  const DevelopmentService();

  @override
  Future<void> _initialize() async {
    RepositoryService.development();
  }
}

class ProductionService extends Service {
  const ProductionService();

  @override
  Future<void> _initialize() async {
    RepositoryService.production();
  }
}
