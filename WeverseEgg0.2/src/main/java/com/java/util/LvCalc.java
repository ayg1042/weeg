package com.java.util;

// 레벨 경험치 계산 클래스
public class LvCalc {
	
	public static int[] lvCalc(int vocal, int dance, int rap, int ent) {
        int totalStats = vocal + dance + rap + ent;
        int level = totalStats / 50;
        int experience = (totalStats % 50) * 2;
        
        return new int[]{level, experience};
    }
	
}
