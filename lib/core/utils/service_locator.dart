import 'package:bookly/Features/Splash/data/repos/search_repos_impl.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {

 getIt.registerSingleton<ApiService>(
   
      ApiService(
        Dio(),
      
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>(),),);

  //  getIt.registerSingleton<AuthRepo>(
  //   AuthRepo(
  //     getIt.get<ApiService>(),
  //   ),
  // );
}

// class AuthRepo {
//   final ApiService apiService;

//   AuthRepo(this.apiService);
// }
