class Evaluate {
  String result(List<String> expression) {
    List<String> postfix = [];
    List<String> stack = [];

    for (int i = 0; i < expression.length; i++) {
      if (expression[i] == "–" &&
          (i == 0 || expression[i - 1] == "×" || expression[i - 1] == "÷" ||
              expression[i - 1] == "+" || expression[i - 1] == "–")) {
        expression[i + 1] = "-${expression[i + 1]}";
        continue;
      }

      if (expression[i] != "×" &&
          expression[i] != "÷" &&
          expression[i] != "+" &&
          expression[i] != "–" &&
          expression[i] != "%") {
        postfix.add(expression[i]);
      } else {
        if (stack.isEmpty) {
          stack.add(expression[i]);
        } else if ((expression[i] == "+" || expression[i] == "–")) {
          while (stack.isNotEmpty && (stack.last == "×" || stack.last == "÷" || stack.last == "%")) {
            postfix.add(stack.removeLast());
          }
          stack.add(expression[i]);
        } else {
          stack.add(expression[i]);
        }
      }
    }

    while (stack.isNotEmpty) {
      postfix.add(stack.removeLast());
    }

    List<String> stack2 = [];
    double a, b, val = 0;

    for (int i = 0; i < postfix.length; i++) {
      if (postfix[i] != "×" &&
          postfix[i] != "÷" &&
          postfix[i] != "+" &&
          postfix[i] != "–" &&
          postfix[i] != "%") {
        stack2.add(postfix[i]);
      } else {
        a = double.parse(stack2.removeLast());
        b = stack2.isNotEmpty ? double.parse(stack2.removeLast()) : 0;

        if (postfix[i] == "×") {
          val = a * b;
        } else if (postfix[i] == "÷") {
          val = b / a;
        } else if (postfix[i] == "+") {
          val = a + b;
        } else if (postfix[i] == "–") {
          val = b - a;
        } else if (postfix[i] == "%") {
          val = b % a;
        }

        stack2.add(val.toString());
      }
    }

    return stack2.last;
  }
}
