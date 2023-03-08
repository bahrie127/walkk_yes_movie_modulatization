// Mocks generated by Mockito 5.3.2 from annotations
// in yes_watching_trending/test/trending/data/repositories/trending_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yes_watching_trending/trending/data/datasources/trending_remote_datasource.dart'
    as _i3;
import 'package:yes_watching_trending/trending/data/models/trending_response_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTrendingResponseModel_0 extends _i1.SmartFake
    implements _i2.TrendingResponseModel {
  _FakeTrendingResponseModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TrendingRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTrendingRemoteDatasource extends _i1.Mock
    implements _i3.TrendingRemoteDatasource {
  MockTrendingRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.TrendingResponseModel> getTrendingAll() => (super.noSuchMethod(
        Invocation.method(
          #getTrendingAll,
          [],
        ),
        returnValue: _i4.Future<_i2.TrendingResponseModel>.value(
            _FakeTrendingResponseModel_0(
          this,
          Invocation.method(
            #getTrendingAll,
            [],
          ),
        )),
      ) as _i4.Future<_i2.TrendingResponseModel>);
}
