import 'dart:io';

 void main()
 {
   print("enter mark of english:");
   int e=int.parse(stdin.readLineSync());

   print("enter mark of math:");
   int m = int.parse(stdin.readLineSync());

   print("enter mark of physics:");
   int p=int.parse(stdin.readLineSync());

   print("enter mark of computer:");
   int c=int.parse(stdin.readLineSync());

   print("enter mark of biology:");
   int b=int.parse(stdin.readLineSync());

   int sum= e+m+p+c+b;
   print("total of all sub is :");
   print(sum);


   double percentage = sum / 500 * 100;
   print("Percentage is:");
   print(percentge);

 }
