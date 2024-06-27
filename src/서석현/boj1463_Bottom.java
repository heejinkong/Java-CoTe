package BaeJoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class boj1463_Bottom {
    static int dp[];


    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        dp = new int[n+1];
        dp[0] = dp[1] = 0;
        System.out.println(one(n));
    }

//    ex)
//    i = 2
//    dp[2] = dp[1] + 1 = 0 + 1 = 1 (1을 빼기)
//    2 % 2 == 0 이므로 dp[2] = Math.min(dp[2], dp[2 / 2] + 1) = Math.min(1, 0 + 1) = 1 (2로 나누기)
//    dp 배열: [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    public static int one(int n) {
        for (int i = 2; i <= n; i++) {
            dp[i] = dp[i - 1] + 1;  //+1을 한 이유는 연산을 한번 수행했음을 의미
            if (i % 2 == 0) {
                dp[i] = Math.min(dp[i], dp[i / 2] + 1);
            }
            if (i % 3 == 0) {
                dp[i] = Math.min(dp[i], dp[i / 3] + 1);
            }
        }
        return dp[n];
    }
}
