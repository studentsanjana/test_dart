import 'dart:io';

// import 'package:flutter/cupertino.dart';

class Student {

  Map<int, Map<String, dynamic>> students = {};

  int nextId = 101;
  int count = 0;

  void add(String sname, int age, String course, double percentage) {
    students[nextId] = {
      'sname': sname,
      'age': age,
      'course': course,
      'percentage': percentage,
    };

    print("Student added Successfully.");
    print("Generated Student Id : $nextId");
    nextId++;
    count++;
  }

  void displayDetails()
  {
    print("---------------------Student Details-----------------");
    students.forEach((sid, data){
      print("Student Id : $sid");
      print("Student Name : ${data['sname']}");
      print("Student Age : ${data['age']}");
      print("Student Course : ${data['course']}");
      print("Student Percentage : ${data['percentage']}");
    });
    print(" ");
    print("----------------------------------------------------");
  }

  void search(int sid)
  {
    if(students.containsKey(sid))
    {
      print("Student Id : $sid");
      print("Student Name : ${students[sid]!['sname']}");
      print("Student Age : ${students[sid]!['age']}");
      print("Student Course : ${students[sid]!['course']}");
      print("Student Percentage : ${students[sid]!['percentage']}");
    }
    else
    {
      print("Student Not found");
    }
  }

  void update(int sid, String sname, int age, String course, double percentage)
  {
    if(students.containsKey(sid))
    {
      students[sid]!['sname'] = sname;
      students[sid]!['age'] = age;
      students[sid]!['course'] = course;
      students[sid]!['percentage'] = percentage;

      print("Student Record updated Successfully.");
    }
    else
    {
      print("Student Not found");
    }
  }


  void delete(int sid)
  {
    if(students.containsKey(sid))
    {
      students.remove(sid);
      print("Student Record Deleted Successfully.");
      count--;
    }
    else
    {
      print("Student Id not found please enter correct Student Id.");
    }
  }

  void countStudents()
  {
    if(count > 0){
      print("Total Student = $count");
    }
    else
    {
      print("No Student Record Found.");
    }

  }

}
void main()
{

  Student std = Student();
  while(true)
  {
    print("-------------- Console App -------------");
    print("1. Add Student");
    print("2. View Student");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Total Student");
    print("6. Exit.");
    stdout.write("Enter you choice :");
    int choice = int.parse(stdin.readLineSync()!);
    print(" ");


    switch(choice)
    {
      case 1:
        stdout.write("Enter your name : ");
        String sname = stdin.readLineSync()!;
        stdout.write("Enter your Age : ");
        try{
          int age = int.parse(stdin.readLineSync()!);
          if(age < 16)
          {
            throw Exception("You are not elligible please enter age above 16");
          }

          stdout.write("Enter your course : ");
          String course = stdin.readLineSync()!;

          stdout.write("Enter your percentage(don't include percentage symbol) : ");
          double percentage = double.parse(stdin.readLineSync()!);

          if(percentage < 0 || percentage >= 100)
          {
            throw Exception("Please enter the percentage range in (0 - 100)");
          }

          std.add(sname, age, course, percentage);
        }
        catch(error)
        {
          print(error);
        }
        break;

      case 2:
        std.displayDetails();
        break;

      case 3:
        stdout.write("Enter the Student Id :");
        int sid = int.parse(stdin.readLineSync()!);
        std.search(sid);
        break;

      case 4:
        stdout.write("Enter the Student Id :");
        int sid = int.parse(stdin.readLineSync()!);
        std.delete(sid);
        break;

      case 5:
        std.countStudents();
        break;

      case 6:
        print("Program Terminated!");
        return;
    }
  }

}