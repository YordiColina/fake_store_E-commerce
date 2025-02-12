import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/driven_adapters/API/auth_api_implementation.dart';

final authRepositoryProvider = Provider((ref) => AuthApiImplementation());