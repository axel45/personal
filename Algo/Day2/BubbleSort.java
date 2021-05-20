import java.util.*;
import java.io.FileNotFoundException;
import java.io.File;

public class BubbleSort extends InsertionSort {

    public static void bubbleSort(List<Integer> numbers, int size) {
        // 実装部分
        System.out.println("");
        int flag = 1;
        int n = 0;
        while (flag == 1) {
            flag = 0;
            for (int i = size - 1; i >= 1; i--) {
                if (numbers.get(i) < numbers.get(i - 1)) {
                    int v = numbers.get(i);
                    numbers.set(i, numbers.get(i - 1));
                    numbers.set(i - 1, v);
                    flag = 1;
                    n++;
                }
                print(numbers, size);
            }
        }
        System.out.println(n);
    }

    public static void main(String args[]) {
        // ファイル入力部分
        FileDate fileDate = getFileDateByFile("/Users/satoushougo/workSpace/personal/Algo/Day2/InsertionSortTest.txt");
        bubbleSort(fileDate.numbers, fileDate.size);
    }
}