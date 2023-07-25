package kr.co.jhta.pony.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.jhta.pony.service.NoticeService;
import kr.co.jhta.pony.service.QuestionService;

// 페이징 처리와 service 값 전송을 위한 클래스
@Component
public class ControllerAdvisor {
	private static QuestionService qservice;
    private static NoticeService nservice;

    @Autowired
    public ControllerAdvisor(QuestionService qservice, NoticeService nservice) {
        ControllerAdvisor.qservice = qservice;
        ControllerAdvisor.nservice = nservice;
    }

    public static Map<String, Object> getPageData(int currentPage, int recordPerPage, String targetPage, QuestionService qservice, NoticeService nservice) {
        int totalNumber;
        int startNo;
        int endNo;

        if ("question".equals(targetPage)) {
            totalNumber = qservice.getTotal();
        } else if ("notice".equals(targetPage)) {
            totalNumber = nservice.getTotal();
        } else {
            // 다른 페이지에 대한 경우를 추가해야 한다면 여기에 처리하십시오.
            throw new IllegalArgumentException("유효하지 않은 대상 페이지: " + targetPage);
        }

        int totalPage = (int) Math.ceil((double) totalNumber / recordPerPage);
        startNo = (currentPage - 1) * recordPerPage + 1;
        endNo = Math.min(startNo + recordPerPage - 1, totalNumber);

        Map<String, Object> map = new HashMap<>();
        map.put("totalPage", totalPage);
        map.put("recordPerPage", recordPerPage);
        map.put("currentPage", currentPage);
        map.put("startNo", startNo);
        map.put("endNo", endNo);

        return map;
    }
}

