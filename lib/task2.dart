import 'dart:io';
import 'dart:math';

void main(){
  print("type \"exit\" to quit game");
  print('type \"roll\" to roll your dice');
  print('type \"show points" to see points of both you and computer');
  diceGame();

}

diceGame(){
  final random = Random();
  //dice chances
  var dice = <int>[1,2,3,4,5,6];

  //scores
  var comp = 0;
  var user = 0;

  while (true){
    int compRoll1 = dice[random.nextInt(dice.length)];
    int compRoll2 = dice[random.nextInt(dice.length)];
    //რენდომის ამოღებას აქ გავაკეთებ თუ გაგორებისას ზუსტად არ აქვს მგონი აზრი
    // და ბარემ აქ გავაკეთებო გავიფიქრე და გაგორებისას უბრალოდ გამოვიძახებ :D
    int userRoll1 = dice[random.nextInt(dice.length)];
    int userRoll2 = dice[random.nextInt(dice.length)];
    var userPoints = userRoll1 + userRoll2;
    var compPoints = compRoll2 + compRoll1;

    var userChoice = stdin.readLineSync()!.toLowerCase();


    //exit command
    if (userChoice =='exit'){
      print('computer scored $comp , user scored $user');
      if (comp > user){
        print('computer wins');
      }else if(user > comp){
        print('user wins');
      }else if(comp == user){
        print('match is even');
      }
      break;
    }
    //მიმდინარე ქულების ნახვა
    if (userChoice == 'show points'){
      print('computer has $comp points \n user has $user points');
    }
    //კამათლის გაგორება
    if (userChoice == 'roll'){
        print('user rolled $userRoll1 and $userRoll2 \n altogether : $userPoints');
        print('computer rolled $compRoll1 and $compRoll2 \n altogether : $compPoints');

        if (userPoints > compPoints){
          user +=1;
          print('user gets +1 point');
        }else if(compPoints > userPoints){
          comp +=1;
          print('computer gets +1 points');
        }else {
          print('both rolls are even, no one gets point');
        }

    }


  }


}