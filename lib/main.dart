import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  condition = condition.toLowerCase();

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.orange;
  } else if (condition.contains('cloud') || condition.contains('overcast')) {
    return Colors.blueGrey;
  } else if (condition.contains('partly cloudy')) {
    return Colors.blueGrey;
  } else if (condition.contains('mist') ||
      condition.contains('fog') ||
      condition.contains('drizzle') ||
      condition.contains('rain') ||
      condition.contains('shower')) {
    return Colors.blue;
  } else if (condition.contains('snow') ||
      condition.contains('sleet') ||
      condition.contains('hail')) {
  } else if (condition.contains('thunder') ||
      condition.contains('storm') ||
      condition.contains('tornado')) {
    return Colors.lightBlue;
  }
  // Return a default color if the condition is not recognized

  return Colors.blue;
}
