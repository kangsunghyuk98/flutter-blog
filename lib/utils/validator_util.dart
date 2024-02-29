import 'package:validators/validators.dart';

Function validateUsername () {
    return (String? value){
    if(value!.isEmpty) {
      return "빈값을 입력할 수 없습니다.";
    } else if(!isAlphanumeric(value!)) {
      return "영문 아이디만 입력가능합니다.";
    } else if(value.length > 12) {
      return "12자를 초과할 수 업습니다.";
    } else if(value.length < 4) {
      return "4자보다 많아야 합니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword () {
  return (String? value) {
    if(value!.isEmpty) {
      return "빈값을 입력할 수 없습니다.";
    } else if(value.length > 12) {
      return "12자를 초과할 수 업습니다.";
    } else if(value.length < 4) {
      return "4자보다 많아야 합니다.";
    } else {
      return null;
    }
  };
}


Function validateEmail () {
  return (String? value) {
    if(value!.isEmpty) {
      return "빈값을 입력할 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle () {
  return (String? value) {
    if(value!.isEmpty) {
      return "빈값을 입력할 수 없습니다.";
    } else if (value.length > 30) {
      return "길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent () {
  return (String? value) {
    if(value!.isEmpty) {
      return "빈값을 입력할 수 없습니다.";
    } else if (value.length > 500) {
      return "길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}