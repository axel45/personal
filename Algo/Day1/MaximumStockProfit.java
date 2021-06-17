import java.util.*;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;
import java.lang.Math;
import java.nio.file.Path;
import java.nio.file.Paths;

public class MaximumStockProfit {
    public static Integer maxNumber = 200000;
    public static void main (String args[]){
        // 価格を入力の数入力
        List<Integer> plices = new ArrayList<>(maxNumber);
        int number = 0;

        try {
            File file = new File("/Users/satoushougo/workSpace/personal/Algo/Day1/MaximumStockProfitTest.txt");
            Scanner scanner = new Scanner(file);
            while (scanner.hasNext()){
                String num = scanner.next();
                int numInt = Integer.parseInt(num);
                number = numInt;
                System.out.println(number);
                if (scanner.hasNextLine()) {
                    break;
                }
            }
            while (scanner.hasNext()){
                String num = scanner.next();
                int numInt = Integer.parseInt(num);
                plices.add(numInt);
                System.out.print(numInt + " ");

            }
            scanner.close();
        } catch(FileNotFoundException e){
            System.out.println(e);
        }

        System.out.println("");
        // 最小初期値
        int minv = plices.get(0);
        // 最大初期値
        int maxv = -200000;
        
        for (int i = 1; i < number; i++) {
            maxv = Math.max(maxv, plices.get(i) - minv);
            minv = Math.min(minv, plices.get(i));
        }

        System.out.println(maxv);
    }
}