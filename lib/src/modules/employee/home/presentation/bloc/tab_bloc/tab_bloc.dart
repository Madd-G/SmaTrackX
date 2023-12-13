import 'package:smatrackx/core.dart';

part 'tab_event.dart';

part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabStateInitial()) {
    on<TabEventWeek>((event, emit) {
      emit(const TabStateIsInWeek(0));
    });

    on<TabEventMonth>((event, emit) {
      emit(const TabStateIsInMonth(1));
    });
  }
}
