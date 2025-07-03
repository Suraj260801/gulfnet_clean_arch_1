// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gulfnet_clean_arch_1/core/errors/failures.dart';

import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';
import 'package:gulfnet_clean_arch_1/src/domain/providers.dart';
import 'package:gulfnet_clean_arch_1/src/domain/usecases/get_all_posts.dart';
import 'package:gulfnet_clean_arch_1/src/features/posts/presentation/controllers/post_list_controller.dart';
import 'package:gulfnet_clean_arch_1/src/features/posts/presentation/pages/post_list_page.dart';
import 'package:mocktail/mocktail.dart';

class Listener<T> extends Mock {
  void call(T? previous, T value);
}
class MockGetAllPostsUseCase extends Mock implements GetAllPosts{}
void main() {

  late MockGetAllPostsUseCase mockUseCase;

  setUp((){
    mockUseCase=MockGetAllPostsUseCase();
  });

  test('returns posts when usecase succeeds.',() async {
    //arrange
    final postsList=[
      PostEntity(userId: 0, id: 0, title: 'Title 1', body: "This is description 1 for assignmrnt."),
      PostEntity(userId: 1, id: 1, title: 'Tote', body: 'This is descriotopn 2 for test 2')
    ];

    when(()=>mockUseCase()).thenAnswer((_)async=>Right(postsList));

    final container=ProviderContainer(overrides: [
      getAllPostsUseCaseProvider.overrideWithValue(mockUseCase)
    ]);

    final result=await container.read(postListControllerProvider.future);
    
    expect(result, equals(postsList));
    verify(()=>mockUseCase()).called(1);

  });

  test('returns exception when usecase fails',() async {
    //Arrange
    when(()=>mockUseCase()).thenAnswer((_)async=>Left(UnexpectedFailure('Data fetching failed')));

    final container=ProviderContainer(overrides: [
        getAllPostsUseCaseProvider.overrideWithValue(mockUseCase)
    ]);

    expect(()=>container.read(postListControllerProvider.future), throwsA(isA<Exception>()));

    verify(()=>mockUseCase()).called(1);


  });

  // testWidgets('shows loading indicator', (tester) async {
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         postListControllerProvider.overrideWith((ref) => const AsyncLoading()),
  //       ],
  //       child: const MaterialApp(home: PostListPage()),
  //     ),
  //   );
  //
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  // });
  //
  // testWidgets('shows list of posts', (tester) async {
  //   final posts = [
  //     PostEntity(userId: '1', title: 'Post 1', body: 'Body 1'),
  //     PostEntity(userId: '2', title: 'Post 2', body: 'Body 2'),
  //   ];
  //
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         postListControllerProvider.overrideWith((ref) => AsyncData(posts)),
  //       ],
  //       child: const MaterialApp(home: PostListPage()),
  //     ),
  //   );
  //
  //   for (final post in posts) {
  //     expect(find.text(post.title), findsOneWidget);
  //     expect(find.text(post.body), findsOneWidget);
  //   }
  // });
  //
  // testWidgets('shows error message when error occurs', (tester) async {
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         postListControllerProvider.overrideWith(
  //                 (ref) => AsyncError(Exception('Failed to load'), StackTrace.empty)),
  //       ],
  //       child: const MaterialApp(home: PostListPage()),
  //     ),
  //   );
  //
  //   expect(find.textContaining('Exception: Failed to load'), findsOneWidget);
  // });
  //
  // testWidgets('shows "No Posts Yet!" when post list is empty', (tester) async {
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         postListControllerProvider.overrideWith((ref) => const AsyncData([])),
  //       ],
  //       child: const MaterialApp(home: PostListPage()),
  //     ),
  //   );
  //
  //   expect(find.text('No Posts Yet! Add One Below'), findsOneWidget);
  // });
  //
  // testWidgets('refresh button invalidates the provider', (tester) async {
  //   final listener = Listener<AsyncValue<List<PostEntity>>>();
  //
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         postListControllerProvider.overrideWith((ref) {
  //           ref.listenManual(postListControllerProvider, listener);
  //           return AsyncData([]);
  //         }),
  //       ],
  //       child: const MaterialApp(home: PostListPage()),
  //     ),
  //   );
  //
  //   await tester.tap(find.byIcon(Icons.refresh));
  //   await tester.pump();
  //
  //   // The actual invalidate logic works inside app runtime,
  //   // This line ensures the widget didn’t crash
  //   expect(find.byType(PostListPage), findsOneWidget);
  // });
}
