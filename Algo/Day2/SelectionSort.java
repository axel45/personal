import java.util.*;
import java.io.FileNotFoundException;
import java.io.File;

public class SelectionSort extends InsertionSort {

    public static void selectionSort(List<Integer> numbers, int size) {
        // 実装部分
        // 右に存在する未ソート部分の一番小さい数を探し、場所を交換する
        System.out.println("");
        for (int i = 0; i < size - 1; i++) {
            int n = i;
            for (int j = i; j < size; j++) {
                if (numbers.get(j) < numbers.get(n)) {
                    n = j;
                }
            }
            int num = numbers.get(n);
            numbers.set(n, numbers.get(i));
            numbers.set(i, num);
            print(numbers, size);
        }
    }

    public static void main(String args[]) {
        // ファイル入力部分
        FileDate fileDate = getFileDateByFile("/Users/satoushougo/workSpace/personal/Algo/Day2/InsertionSortTest.txt");
        selectionSort(fileDate.numbers, fileDate.size);
    }
}