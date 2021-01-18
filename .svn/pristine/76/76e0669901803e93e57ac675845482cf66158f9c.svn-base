package kr.or.ddit.findidpw.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.findidpw.service.FindIdPwService;
import kr.or.ddit.findidpw.vo.EmpVO;

@Controller
public class FindController {
	
	@Resource(name="findIdPwService")
	FindIdPwService findIdPwService;
	
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@RequestMapping("/findIdView")
	public String findIdView() {
		return "emp/findId2";
	}
	
	@RequestMapping("/findPwView")
	public String findPwView() {
		return "emp/findPw2";
	}
	
	@RequestMapping("/findId")
	public String findId(EmpVO empVO, Model model) {
		logger.debug("이름 : {}, 핸드폰번호 : {}",empVO.getEmpNm(),empVO.getEmpHp());

		EmpVO dbVO = null;
		try {
			dbVO = findIdPwService.getEmp(empVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (dbVO == null) {
			model.addAttribute("result", "일치하는 회원정보가 없습니다.");
		} else {
			model.addAttribute("check", "O");
			model.addAttribute("result", dbVO.getEmpId());
		}
		return "jsonView";
	}

	@RequestMapping("/findPw")
	public String findPw(EmpVO empVO, Model model, HttpSession session) {
		
		logger.debug("아이디 : {}, 핸드폰번호 : {}", empVO.getEmpNm(), empVO.getEmpHp());

		String receiver = empVO.getEmpHp().replaceAll("-", "");
		
		logger.debug("바뀐 번호 {}",receiver);

		EmpVO dbVO = null;
		try {
			dbVO = findIdPwService.getEmp(empVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (dbVO == null) {
			model.addAttribute("result", "일치하는 회원정보가 없습니다.");
		} else {
			
			int rand = (int) (Math.random() * 899999) + 100000;

		      String hostname = "api.bluehouselab.com";
		      String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		      CredentialsProvider credsProvider = new BasicCredentialsProvider();
		      credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
		            new UsernamePasswordCredentials("sandbox", "a5400ec82aef11ebb6190cc47a1fcfae"));

		      // Create AuthCache instance
		      AuthCache authCache = new BasicAuthCache();
		      authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		      // Add AuthCache to the execution context
		      HttpClientContext context = HttpClientContext.create();
		      context.setCredentialsProvider(credsProvider);
		      context.setAuthCache(authCache);

		      DefaultHttpClient client = new DefaultHttpClient();

		      try {
		         HttpPost httpPost = new HttpPost(url);
		         httpPost.setHeader("Content-type", "application/json; charset=utf-8");
		         String json = "{\"sender\":\"" + "01056894820" + "\",\"receivers\":[\"" + receiver
		               + "\"],\"content\":\"" + "비밀번호 찾기 인증번호 : " + rand + "\"}";

		         StringEntity se = new StringEntity(json, "UTF-8");
		         httpPost.setEntity(se);

		         HttpResponse httpResponse = client.execute(httpPost, context);
		         System.out.println(httpResponse.getStatusLine().getStatusCode());

		         InputStream inputStream = httpResponse.getEntity().getContent();
		         if (inputStream != null) {
		            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
		            String line = "";
		            while ((line = bufferedReader.readLine()) != null)
		               System.out.println(line);
		            inputStream.close();
		         }
		      } catch (Exception e) {
		         System.err.println("Error: " + e.getLocalizedMessage());
		      } finally {
		         client.getConnectionManager().shutdown();
		      }
		      
		      empVO.setPassword(rand+"");
		      
		      try {
				findIdPwService.updatePass(empVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		      
		      model.addAttribute("check", "O");
		      model.addAttribute("result", "등록된 핸드폰으로 임시비밀번호가 전송되었습니다.");
		}
		
		return "jsonView";
	}
	
	
	@RequestMapping("/IdCheck")
	public String IdCheck(EmpVO empVO, Model model) {
		logger.debug("이름 : {}",empVO.getEmpId());
		
		EmpVO dbVO = null;
		try {
			dbVO = findIdPwService.getEmp(empVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("dbVO2222222222222 : {}",dbVO);
		if (dbVO == null) {
			model.addAttribute("result", "사용가능 합니다.");
		} else {
			model.addAttribute("check", "O");
			model.addAttribute("result", "중복된 사원번호입니다. 다시 입력해주세요.");
			
		}
		
		return "jsonView";
	}
	
}
