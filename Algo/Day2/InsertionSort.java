import java.util.*;
import java.io.FileNotFoundException;
import java.io.File;

public class InsertionSort {
    public static Integer maxSize = 100;
    public static Integer maxNum = 1000;

    public static FileDate getFileDateByFile(String filePath) { 
        List<Integer> numbers = new ArrayList<>(maxSize);
        int size = 0;    
        try {
            File file = new File(filePath);
            Scanner scanner = new Scanner(file);
            while (scanner.hasNext()) {
                int numInt = Integer.parseInt(scanner.next());
                System.out.println(numInt);
                size = numInt;
                if (scanner.hasNextLine()) {
                    break;
                }
            }
            while (scanner.hasNext()) {
                int numInt = Integer.parseInt(scanner.next());
                numbers.add(numInt);
                System.out.print(numInt + " ");
            }
            System.out.println("");
        } catch(FileNotFoundException e) {
            System.out.println(e);
        }
        FileDate fileDate = new FileDate(filePath, size, numbers);
        return fileDate;
    }

    public static void print(List<Integer> numbers, int size) {
        for (int i = 0; i < size; i++) {
            if(i > 0) System.out.print(" ");
            System.out.print(numbers.get(i));
        }
        System.out.println("");
    }

    public static void insertionSort(List<Integer> numbers, int size) {
        // 実装部分
        // 自分より左の数字は必ず、左にある数の中で一番大きい数字
        for (int i = 1; i < size; i++) {
            int nextNum = numbers.get(i);
            int b = i - 1;
            while (b >= 0 && numbers.get(b) > nextNum) {
                numbers.set(b + 1, numbers.get(b));
                b--;
            }
            numbers.set(b + 1, nextNum);
            print(numbers, size);
        }
    }

    public static void main (String args[]) {

        // ファイル入力部分
        FileDate fileDate = getFileDateByFile("/Users/satoushougo/workSpace/personal/Algo/Day2/InsertionSortTest.txt");
        insertionSort(fileDate.numbers, fileDate.size);
    }
}