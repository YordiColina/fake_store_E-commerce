import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/driven_adapters/API/user_api_implementation.dart';

final userRepositoryProvider = Provider((ref) => UserApiImplementation());