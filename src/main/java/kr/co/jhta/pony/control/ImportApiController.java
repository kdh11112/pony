package kr.co.jhta.pony.control;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Api(tags = "임포트")
public class ImportApiController {
	private IamportClient api;
	
	public ImportApiController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        // this.api = new IamportClient("[REST API키]","[REST API secret]");
        this.api = new IamportClient("6811244560502637","Kb93hC6SXUZ4gTj8UI08eDeJO8Vog2toWjWpCYfQhlTPxK6oJKe3GuBz3wXqwisPKZDkg3PFJ7wnY3Wg");
    }

	// 결제 검증
    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
    	log.info("paymentByImpUid({}) invoked.", imp_uid);
    	// api.paymentByImpUid 함수는 imp_uid를 검사하며, 데이터를 보내주게 되는데, 이 데이터와 처음 금액이 일치하는지를 확인하면 됨(js)
        return api.paymentByImpUid(imp_uid);
	}
}
