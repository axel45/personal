import java.util.*;

final class FileDate {
    public String filePath;
    public int size;
    public List<Integer> numbers;

    public FileDate(String filePath, int size, List<Integer> numbers) {
        this.filePath = filePath;
        this.size = size;
        this.numbers = numbers;
    }
}