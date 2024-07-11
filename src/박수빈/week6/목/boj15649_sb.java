package cote_0711;

import java.util.Scanner;
import java.util.*;
import java.util.stream.IntStream;

public class boj15649_sb {

        static int N, M;
        static boolean[] visited;
        static int[] result;

        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            N = sc.nextInt();
            M = sc.nextInt();
            visited = new boolean[N + 1];
            result = new int[M];

            dfs(0);
            sc.close();
        }

        public static void dfs(int depth) {
            if (depth == M) {
                for (int i = 0; i < M; i++) {
                    System.out.print(result[i] + " ");
                }
                System.out.println();
                return;
            }

            for (int i = 1; i <= N; i++) {
                if (!visited[i]) {
                    visited[i] = true;
                    result[depth] = i;
                    dfs(depth + 1);
                    visited[i] = false;
                }
            }
        }
    }



