import 'dart:io';

void main()
{

  print('enter the integer:');
  int a=int.parse(stdin.readLineSync()!);


  for(int i=1;i<=10;++i)
  {
    int multi =a*i;
    print("$a*$i=$multi");
  }
}