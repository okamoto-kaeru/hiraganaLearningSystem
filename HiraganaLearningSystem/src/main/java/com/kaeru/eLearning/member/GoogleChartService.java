package com.kaeru.eLearning.member;

import org.json.simple.JSONObject;

public interface GoogleChartService {
	public JSONObject getChartData(String memberId);
}
