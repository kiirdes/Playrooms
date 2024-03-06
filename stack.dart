class MyStack {
  MyNode? top;

  void push(String value) {
    top = MyNode(value, top);
  }

  String? pop() {
    if (top == null) {
      return null;
    }
    String value = top!.value;
    top = top!.under;

    return value;
  }
}

class MyNode {
  String value = "";
  MyNode? under;

  MyNode(this.value, this.under);
}

void print_stack(MyStack stack) {
  MyNode? curr_item = stack.top;

  print("== top of stack ==");
  while (curr_item != null) {
    print(curr_item.value);
    curr_item = curr_item.under;
  }
  print("== end of stack ==");
}

int main() {
  MyStack new_stack = new MyStack();

  new_stack.push("a");
  new_stack.push("b");
  new_stack.push("c");

  print_stack(new_stack);

  print(new_stack.pop());
  print(new_stack.pop());

  print_stack(new_stack);

  print(new_stack.pop());
  print(new_stack.pop());

  print_stack(new_stack);

  return 0;
}
