package com.kaeru.eLearning.member;

import java.util.List;

public interface GradeService {

	void insertGrade(GradeVO vo);

	public List<GradeVO> getGradeByMemberId(String memberId);
}