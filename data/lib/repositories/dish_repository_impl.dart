import 'package:data/entity/dish_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:data/providers/provider.dart';
import 'package:domain/domain.dart';

class DishRepositoryImpl implements DishRepository{
  final Provider _provider;

  DishRepositoryImpl({
    required provider,
  }) : _provider = provider;

  @override
  Future<List<DishModel>> fetchAllDishes() async{
    final List<DishEntity> result = await _provider.getAllDishes();    
    return result.map((item) => DishMapper.toModel(item)).toList();
  }
}