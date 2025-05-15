import java.util.Map;

class Solution {
    private static final Map<String, Integer> table = Map.of(
        "zero", 0,
        "one", 1,
        "two", 2,
        "three", 3,
        "four", 4,
        "five", 5,
        "six", 6,
        "seven", 7,
        "eight", 8,
        "nine", 9
    );
    
    public int solution(String s) {
        int answer = 0;

        for (Map.Entry<String, Integer> entry : table.entrySet()) {
            s = s.replace(entry.getKey(), entry.getValue().toString());
        }
        answer = Integer.parseInt(s);

        return answer;
    }
}