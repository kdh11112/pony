package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	
	int noticeNo;
	
	String noticeTitle;
	
	String noticeContents;
	
	String noticeFile;
	
	String noticeDate;
	
	int noticeHits;
	
	int memberNo;
	
}
