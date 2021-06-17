import java.util.*;
import java.io.FileNotFoundException;
import java.io.File;

class Card {
    public String mark;
    public int num;

    Card(String mark, int num) {
        this.mark = mark;
        this.num = num;
    }
}

public class StableSort {
    public static int Size = 36;

    public static List<Card> getFileDateByFile(String filePath) { 
        List<Card> aCards = new ArrayList<>(Size);
        try {
            File file = new File(filePath);
            Scanner scanner = new Scanner(file);
            while (scanner.hasNext()) {
                int numInt = Integer.parseInt(scanner.next());
                System.out.println(numInt);
                Size = numInt;
                if (scanner.hasNextLine()) {
                    break;
                };
            }
            for (int i = 0; i < Size; i++) {
                String cardString = scanner.next();
                String mark = String.valueOf(cardString.charAt(0));
                int numInt = Character.getNumericValue(cardString.charAt(1));
                Card card = new Card(mark, numInt);
                aCards.add(card);
                System.out.print(mark + numInt + " ");
            }
            // while (scanner.hasNext()) {
            //     String mark = scanner.next();
            //     int numInt = Integer.parseInt(scanner.next());
            //     Card card = new Card(mark, numInt);
            //     aCards.add(card);
            //     System.out.print(card.mark + card.num +" ");
            // }
            System.out.println("");
        } catch(FileNotFoundException e) {
            System.out.println(e);
        }
        return aCards;
    }

    public static void bubbleSort(List<Card> aCards, int size) {
        // 実装部分
        System.out.println("BubbleSort");
        for (int i = 0; i < size - 1; i++) {
            for (int j = size - 1; j >= i + 1; j--) {
                if (aCards.get(j).num < aCards.get(j - 1).num) {
                    Card card = aCards.get(j);
                    aCards.set(j, aCards.get(j - 1));
                    aCards.set(j - 1, card);
                }
            }
        }
    }

    public static void selectionSort(List<Card> aCards, int size) {
        // 実装部分
        // 右に存在する未ソート部分の一番小さい数を探し、場所を交換する
        System.out.println("SelectionSort");
        for (int i = 0; i < size; i++) {
            int n = i;
            for (int j = i; j < size; j++) {
                if (aCards.get(j).num < aCards.get(n).num) {
                    n = j;
                }
            }
            Card card = aCards.get(n);
            aCards.set(n, aCards.get(i));
            aCards.set(i, card);
        }
    }

    public static void printOut(List<Card> cards, int size) {
        for (int i = 0; i < size; i++) {
            if (i > 0) System.out.print(" ");
            System.out.print(cards.get(i).mark + cards.get(i).num);
        }
        System.out.println("");
    }

    public static boolean isStable(List<Card> aCards, List<Card> bCards, int size) {
        for (int i = 0; i < size - 1; i++) {
            if (aCards.get(i).mark != bCards.get(i).mark) return false;
        }
        return true;
    }
    public static void main(String args[]) {
        // ファイル入力部分
        List<Card> aCards = getFileDateByFile("/Users/satoushougo/workSpace/personal/Algo/Day2/StableSortTest.txt");
        List<Card> bCards = new ArrayList<>(Size);
        for (int i = 0; i < Size; i++) bCards.add(aCards.get(i));
        System.out.println("");
        bubbleSort(aCards, Size);
        printOut(aCards, Size);
        System.out.println("Stable" + "\n");
        selectionSort(bCards, Size);
        printOut(bCards, Size);
        if (isStable(aCards, bCards, Size)) {
            System.out.println("Stable");
        } else {
            System.out.println("Not Stable");
        }
    }
}