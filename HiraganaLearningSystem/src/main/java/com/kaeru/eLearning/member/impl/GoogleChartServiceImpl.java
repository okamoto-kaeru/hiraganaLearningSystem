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
		col1.put("label", "행");
		col1.put("type", "String");
		title.add(col1);
		
		col2.put("label", "연상법 1글자");
		col2.put("type", "number");
		title.add(col2);
		
		col3.put("label", "히라가나 1글자");
		col3.put("type", "number");
		title.add(col3);
		
		col4.put("label", "단어형");
		col4.put("type", "number");
		title.add(col4);
		
		// JSON객체에 title행 추가
		data.put("cols",  title);
		
		JSONArray body = new JSONArray();
		int count = 0;	// 3번의 1번은 행 이름 추가하기 위해 count 선언
		for(GradeVO gradeVO : chartDataList) {
			count++;
			JSONObject name = new JSONObject();
			JSONObject kind1 = new JSONObject();
			JSONObject kind2 = new JSONObject();
			JSONObject kind3 = new JSONObject();
			JSONArray row = new JSONArray();
			JSONObject cell = new JSONObject();
			
			if(count % 3 == 1) {
				String hiraganaLine = gradeVO.getHiraganaLine();
				name.put("v", hiraganaLine);
				kind1.put("v", gradeVO.getScore());
			}
			
			if(count % 3 == 2) {
				kind2.put("v", gradeVO.getScore());
			}
			
			if(count % 3 == 0) {
				kind3.put("v", gradeVO.getScore());
				row.add(name);
				row.add(kind1);
				row.add(kind2);
				row.add(kind3);
				cell.put("c", row);
				body.add(cell);
			}
		}
		// JSON객체에 데이터 추가
		data.put("rows", body);
		return data;
	}

}
