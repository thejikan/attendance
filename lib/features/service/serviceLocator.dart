import 'package:attendance/features/api/detailsProvider.dart';
import 'package:attendance/features/api/detailsRepository.dart';
import 'package:attendance/features/model/detailsModel.dart';
import 'package:attendance/features/service/detailsService.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

extension DetailsServiceLocator on GetIt {
  void registerDetailsService(DetailsService service) {
    if (isRegistered<DetailsService>()) {
      unregister<DetailsService>();
    }
    registerSingleton<DetailsService>(service);
  }

  /// Get the registered DetailsService instance. If no registered will create an new instance with empty dashboard Data
  DetailsService getDetailsService() {
    if (!isRegistered<DetailsService>()) {
      var data = DetailsModel.empty();
      var service = DetailsService(
        repository: DetailsRepository(
          provider: DetailsProvider(),
        ),
        detailsModel: data,
      );
      registerSingleton(service);
    }

    return this<DetailsService>();
  }
}