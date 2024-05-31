import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';
import '../../views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeratherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(
        WeatherLoadedState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailurState(
          e.toString(),
        ),
      );
    }
  }
}
