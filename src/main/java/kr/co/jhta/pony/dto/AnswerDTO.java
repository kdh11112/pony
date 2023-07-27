package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnswerDTO {
	
	private int answerNo;
	
	private String answerContents;
	
	private String answerDate;
	
	private int questionNo;
	
}
