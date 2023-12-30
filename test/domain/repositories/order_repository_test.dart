import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/data_source/order_remote_data_source.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';

class MockOrderRemoteDataSource extends Mock implements OrderRemotDataSource {}

void main() {
  late OrderRepository sut;
  late MockOrderRemoteDataSource dataSource;
  setUp(() {
    dataSource = MockOrderRemoteDataSource();
    sut = OrderRepository(orderRemoteDataSource: dataSource);
  });
  group("tests for calling the right methods", () {
    test(
        "addOrderToDo method should call orderRemoteDataSource.addOrderToDo() once ",
        () async {
     
      when(
        () => dataSource.addOrderToDo(
            type: "type", tableNumber: 1, name: "name", quantity: 1),
      ).thenAnswer((_) async => []);
    
      await sut.addOrderToDo(
          type: "type", tableNumber: 1, name: "name", quantity: 1);

     
      verify(
        () => dataSource.addOrderToDo(
            type: "type", tableNumber: 1, name: "name", quantity: 1),
      ).called(1);
    });


    test(" addOrder method should call orderRemoteDataSource.addOrder() once ", () async {
  
      when(
        () => dataSource.addOrder(
            type: "type", tableNumber: 1, name: "name", quantity: 1, price: 1),
      ).thenAnswer((_) async => []);
   
      await sut.addOrder(
            type: "type", tableNumber: 1, name: "name", quantity: 1, price: 1);

    
      verify(
        () => dataSource.addOrder(
            type: "type", tableNumber: 1, name: "name", quantity: 1, price: 1),
      ).called(1);
    } );

    test(" removePreOrder method should call orderRemoteDataSource.removePreOrder() once ", () async {

      when(
        () => dataSource.removePreOrder(
           id: "1"),
      ).thenAnswer((_) async => []);
   
      await sut.removePreOrder(
             id: "1");

   
      verify(
        () => dataSource.removePreOrder(
            id: "1"),
      ).called(1);
    } );
    
    test(" removeOrder method should call orderRemoteDataSource.removeOrder() once ", () async {
     
      when(
        () => dataSource.removeOrder(
             id: "1"),
      ).thenAnswer((_) async => []);
  
      await sut.removeOrder(
           id: "1");

  
      verify(
        () => dataSource.removeOrder(
             id: "1"),
      ).called(1);
    } );
    
    test(" removeToDoOrder method should call orderRemoteDataSource.removeToDoOrder() once ", () async {
     
      when(
        () => dataSource.removeToDoOrder(
            id: "1"),
      ).thenAnswer((_) async => []);
  
      await sut.removeToDoOrder(
            id: "1");

 
      verify(
        () => dataSource.removeToDoOrder(
            id: "1"),
      ).called(1);
    } );




  });
}
