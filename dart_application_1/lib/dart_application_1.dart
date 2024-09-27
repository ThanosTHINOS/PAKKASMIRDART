import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  try {
    stdout.write("Masukkan Angka: ");
    int? totalValue = int.parse(stdin.readLineSync()!);
    print("\nAngka Random: ");
    var arrayNumber = ulangan(0, totalValue, 0, "randomNumber");

    stdout.write("""\nPilihan:
    1. Bubble Sort
    2. Inversi
    3. Shuffle
    Masukkan Pilihan: """);
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        arrayNumber = ulangan(arrayNumber, arrayNumber.length, 0, "sort");
        break;
      case 2:
        arrayNumber = ulangan(arrayNumber, 0, 0, "inversi");
        break;
      case 3:
        arrayNumber = ulangan(arrayNumber, 0, 0, "shuffle");
        break;
    }
    print("\nHasil: ");
    ulangan(arrayNumber, 0, 0, "print");
  } on Exception catch (e) {
    stderr.write("Error: ${e}");
  }
}

ulangan(var data, int totalRepeat, int defaultIndex, String tipeUlangan) {
  var returnData;
  var sortSwap = false;
  switch (tipeUlangan) {
    case "randomNumber":
      returnData = <int>[];
      break;
    case "sort":
      returnData = data;
      totalRepeat = returnData.length - 1;
      break;
    case "inversi":
      returnData = data;
      totalRepeat = ((returnData.length % 2 == 0)
              ? returnData.length / 2
              : (returnData.length - 1) / 2)
          .round();
      break;
    case "shuffle":
      returnData = data;
      totalRepeat = returnData.length;
      break;
    case "print":
      returnData = data;
      totalRepeat = returnData.length;
      break;
  }
  while (defaultIndex < totalRepeat) {
    switch (tipeUlangan) {
      case "randomNumber":
        int randomInt = Random().nextInt(10);
        returnData.add(randomInt);
        stdout.write("Angka ke-${defaultIndex + 1}: ${randomInt}\n");
        break;
      case "sort":
        if (returnData[defaultIndex] > returnData[defaultIndex + 1]) {
          sortSwap = true;
          var temp = returnData[defaultIndex];
          returnData[defaultIndex] = returnData[defaultIndex + 1];
          returnData[defaultIndex + 1] = temp;
        }
        break;
      case "inversi":
        var temp = returnData[defaultIndex];
        returnData[defaultIndex] =
            returnData[returnData.length - 1 - defaultIndex];
        returnData[returnData.length - 1 - defaultIndex] = temp;
        break;
      case "shuffle":
        int randomInt = Random().nextInt(returnData.length - 1);
        var temp = returnData[defaultIndex];
        returnData[defaultIndex] = returnData[randomInt];
        returnData[randomInt] = temp;
        break;
      case "print":
        stdout.write("Angka ke-${defaultIndex + 1}: ${returnData[defaultIndex]}\n");
        break;
    }
    defaultIndex++;
  }
  return (sortSwap) ? ulangan(returnData, 0, 0, "sort") : returnData;
}