import 'dart:developer';
import 'dart:io';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/auth_exception.dart';
import '../../core/fp/either.dart';
import '../../core/restClient/rest_client.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;
  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(
    String email,
    String password,
  ) async {
    try {
      final Response(:data) = await restClient.unAuth.post('/auth', data: {
        'email': email,
        'password': password,
      });
      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          log('Login ou senha inválidos', error: e, stackTrace: s);
          return Failure(AuthUnauthorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: '${e.message}'));
    }
  }

  @override
  Future<Either<RepositoryException, BaseUserModel>> me() async {
    final Response(:data) = await restClient.auth.get('/me');
    try {
      return Success(BaseUserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar usuário logado', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao buscar usuário logado'));
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message ));
    }
  }
}
