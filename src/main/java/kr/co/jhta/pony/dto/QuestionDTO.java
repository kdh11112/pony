package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDTO {
	private int questionNo;
	private String questionTitle;
	private String questionContents;
	private byte questionFile;
	private String questionDate;
	private int memberNo;
	private String answerStatus;
}
