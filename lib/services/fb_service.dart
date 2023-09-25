import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grand_edu/models/after_model.dart';
import 'package:grand_edu/models/al_model.dart';
import 'package:grand_edu/models/feedback_model.dart';
import 'package:grand_edu/models/group_model.dart';
import 'package:grand_edu/models/homework_model.dart';
import 'package:grand_edu/models/reception_model.dart';
import 'package:grand_edu/models/save_model.dart';
import 'package:grand_edu/models/support_model.dart';
import 'package:grand_edu/models/unit_model.dart';
import '../models/student_model.dart';
import '../utils/api.dart';
import '../utils/titles.dart';
import 'auth_service.dart';

final fb = FBService();
final _fb = FirebaseFirestore.instance;

class FBService {
  Future<String?> apply(ALModel al) async {
    try {
      await _fb
          .collection(api.al)
          .doc(al.support)
          .collection(al.student)
          .doc(al.student)
          .set(al.toJson());
      return null;
    } catch (e) {
      return "s";
    }
  }

  Future<SupportModel> speSupports(String id) async {
    final a = await _fb.collection(api.apiSupports).doc(id).get();
    return SupportModel.fromJson(a.data()!);
  }

  Future<String?> saveQues(AllSaveModel save) async {
    try {
      await _fb
          .collection(api.save)
          .doc(api.saveQuestion)
          .collection(auth.tel)
          .doc(auth.tel)
          .set(
            save.toJson(),
          );
      return null;
    } catch (e) {
      print('saveQues: $e');
      return "dkenow";
    }
  }

  Future<AllSaveModel?> saves() async {
    try {
      final data = await _fb
          .collection(api.save)
          .doc(api.saveQuestion)
          .collection(auth.tel)
          .doc(auth.tel)
          .get();
      print(data.data());
      return AllSaveModel.fromJson(data.data()!);
    } catch (e) {
      print("saves: $e");
      return null;
    }
  }

  Future<void> updateUnit(UnitModel unit, String theme) async {
    await _fb
        .collection(api.unit)
        .doc(auth.tel)
        .collection(theme)
        .doc(theme)
        .set(unit.toJson());
  }

  Future<GroupModel> speGroup(String id) async {
    final res = await _fb.collection(api.group).doc(id).get();
    return GroupModel.fromJson(res.data()!);
  }

  Future<void> saveShorts(
    int av,
    int unit,
  ) async {
    ShortModel short = ShortModel(percent: av, unit: unit);
    AllUnitsModel units = AllUnitsModel(shorts: []);
    try {
      final data = await _fb
          .collection(api.unit)
          .doc(auth.tel)
          .collection(api.all)
          .doc(api.all)
          .get();
      units = AllUnitsModel.fromJson(data.data()!);
      final u = units.shorts.firstWhere(
        (element) => element.unit == unit,
        orElse: () => ShortModel(percent: av, unit: unit),
      );
      if (u.percent < av) {
        u.percent = av;
        units.shorts.removeWhere((element) => element.unit == unit);
        units.shorts.add(u);
        await _fb
            .collection(api.unit)
            .doc(auth.tel)
            .collection(api.all)
            .doc(api.all)
            .set(units.toJson());
      }
    } catch (e) {
      units.shorts.add(short);
      await _fb
          .collection(api.unit)
          .doc(auth.tel)
          .collection(api.all)
          .doc(api.all)
          .set(units.toJson());
    }
  }

  Future<AllUnitsModel> allUnits() async {
    try {
      final data = await _fb
          .collection(api.unit)
          .doc(auth.tel)
          .collection(api.all)
          .doc(api.all)
          .get();
      return AllUnitsModel.fromJson(data.data()!);
    } catch (e) {
      print("allUnits");
      return AllUnitsModel(shorts: []);
    }
  }

  Future<UnitModel> unit(String theme) async {
    try {
      final res = await _fb
          .collection(api.unit)
          .doc(auth.tel)
          .collection(theme)
          .doc(theme)
          .get();
      return UnitModel.fromJson(res.data()!);
    } catch (e) {
      return UnitModel(
        formula: false,
        cats: [],
        video: false,
      );
    }
  }

  Future<String?> cancelApply(ALModel al) async {
    try {
      al.status = t.cancelled;
      await _fb
          .collection(api.al)
          .doc(al.support)
          .collection(al.student)
          .doc(al.student)
          .update(al.toJson());
      return null;
    } catch (e) {
      print("e: $e");
      return "d";
    }
  }

  Future<void> sendFeedback(AfterModel a) async {
    a.id = DateTime.now().toIso8601String();
    await _fb
        .collection(api.feedback)
        .doc(a.to)
        .collection(a.to)
        .doc(a.id)
        .set(a.toJson()).then((value) => null);
  }

  Future<StudentModel> me() async {
    final me = await _fb.collection(api.apiStudents).doc(auth.tel).get();
    return StudentModel.fromJson(me.data()!);
  }

  Future<ALModel?> al(StudentModel stu) async {
    try {
      final al = await _fb
          .collection(api.al)
          .doc(stu.supportId)
          .collection(stu.tel)
          .doc(stu.tel)
          .get();
      return ALModel.fromJson(al.data()!);
    } catch (e) {
      print('ddk dee: $e');
      return null;
    }
  }

  Future<HomeworkModel> getHW(StudentModel stu) async {
    try {
      final s = await _fb
          .collection(api.hw)
          .doc(stu.groupId)
          .collection(stu.tel)
          .doc(stu.tel)
          .get();
      final hw = HomeworkModel.fromJson(s.data()!);
      return hw;
    } catch (e) {
      return HomeworkModel(tel: auth.tel, units: []);
    }
  }

  Future<void> updateHW(HWStatsModel stats, StudentModel stu) async {
    final hw = await getHW(stu);
    hw.units.removeWhere(
      (element) => element.unit == stats.unit,
    );
    hw.units.add(stats);
    await _fb
        .collection(api.hw)
        .doc(stu.groupId)
        .collection(stu.tel)
        .doc(stu.tel)
        .set(hw.toJson());
  }

//*********************************************
//*********************************************
//*********************************************
//*********************************************
//*********************************************
  ///spe

  Future<StudentModel> speStudent(String tel) async {
    try {
      final data = await _fb.collection(api.apiStudents).doc(tel).get();
      return StudentModel.fromJson(data.data()!);
    } catch (e) {
      return StudentModel(
        surname: 'surname',
        name: 'name',
        tel: "fake",
        password: 'password',
        groupId: 'groupId',
        xp: 1,
        lessons: 1,
        teacherId: 'teacherId',
        supportId: 'supportId',
      );
    }
  }

//*********************************************
//*********************************************
//*********************************************
//*********************************************
//*********************************************
  ///save
  Future<void> saveStudent(StudentModel stu) async {
    await _fb.collection(api.apiStudents).doc(stu.tel).update(stu.toJson());
  }
}
