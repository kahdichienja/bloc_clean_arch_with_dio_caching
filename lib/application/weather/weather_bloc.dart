import 'package:bloc/bloc.dart';
import 'package:blockpatterntest/domain/weather/repository/weather_repository.dart';
import 'package:blockpatterntest/model/weather/weather.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository repository;

  // WeatherBloc(this.repository);

  // @override
  // WeatherState get initialState => WeatherInitial();
  
  WeatherBloc(this.repository) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) {

    });
  }

    @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // Emitting a state from the asynchronous generator
    yield const WeatherLoading();
    // Branching the executed logic by checking the event type
    if (event is GetWeather) {
      // Emit either Loaded or Error
      try {
        final weather = await repository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield const WeatherError("Couldn't fetch weather. Is the device online?");
      }
    } else if (event is GetDetailedWeather) {
      // Code duplication 😢 to keep the code simple for the tutorial...
      try {
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield const WeatherError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
