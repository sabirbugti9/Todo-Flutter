import 'package:flutter/material.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/features/addTask/view.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/view.dart';
import 'package:tasky/features/login/view.dart';
import 'package:tasky/features/onboarding/view.dart';

import 'package:tasky/features/profile/view.dart';
import 'package:tasky/features/signin/view.dart';
import 'package:tasky/features/splash/view.dart';
import 'package:tasky/features/task_details/view.dart';
import 'package:tasky/features/task_details/widgets/edit_task.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => Profile());
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.addTaskScreen:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());

      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const Home());

      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case Routes.editTask:
        final String taskId = screen.arguments as String;
        return MaterialPageRoute(
            builder: (context) => EditTaskWidget(
                  taskId: taskId,
                ));

      case Routes.taskDeatils:
        final GetTasksResponse task = screen.arguments as GetTasksResponse;
        return MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(task: task),
        );

      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return null;
    }
  }
}
