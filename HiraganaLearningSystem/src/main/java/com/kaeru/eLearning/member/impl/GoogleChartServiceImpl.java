package com.kaeru.eLearning.member.impl;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.member.GoogleChartService;
import com.kaeru.eLearning.member.GradeService;
import com.kaeru.eLearning.member.GradeVO;

@Service
public class GoogleChartServiceImpl implements GoogleChartService {
	
	@Autowired
	GradeService gradeService;
	
	@Override
	public JSONObject getChartData(String memberId) {
		List<GradeVO> chartDataList = gradeService.getAverage(memberId);
		JSONObject data = new JSONObject();
		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();

		JSONArray title = new JSONArray();
		col1.put("id", "line");
		col1.put("label", "행");
		col1.put("type", "string");
		title.add(col1);
		
		col2.put("id", "kindOne");
		col2.put("label", "연상법 1글자");
		col2.put("type", "number");
		title.add(col2);
		
		col3.put("id", "kindTwo");
		col3.put("label", "히라가나 1글자");
		col3.put("type", "number");
		title.add(col3);
		
		col4.put("id", "kindThree");
		col4.put("label", "단어형");
		col4.put("type", "number");
		title.add(col4);
		
		// JSON객체에 title행 추가
		data.put("cols",  title);
		
		JSONArray body = new JSONArray();
		
		for(int i = 0 ; i < chartDataList.size() / 3 ; i++) {
			int count = 0;

			JSONArray row = new JSONArray();
			
			// 행의 이름
			String hiraganaLine = chartDataList.get(i * 3).getHiraganaLine();
			JSONObject name = new JSONObject();
			name.put("v", hiraganaLine);
			row.add(name);
			
			
			for(int j = 0 ; j < 3 ; j++) {
				// 각 퀴즈의 평균
				JSONObject kind = new JSONObject();
				kind.put("v", chartDataList.get(i * 3 + j).getScore());
				row.add(kind);
			}
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		// JSON객체에 데이터 추가
		data.put("rows", body);
		return data;
	}

}
