class Solution {
    public int solution(int[][] sizes) {
        int maxW = 0;
        int maxH = 0;

        for (int[] size : sizes) {
            int width = Math.max(size[0], size[1]);
            int height = Math.min(size[0], size[1]);
            maxW = Math.max(maxW, width);
            maxH = Math.max(maxH, height);
        }

        return maxW * maxH;
    }
}