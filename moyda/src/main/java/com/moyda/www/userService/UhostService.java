package com.moyda.www.userService;

import java.io.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.UserDto.*;
import com.moyda.www.entity.*;

@Service
public class UhostService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private ModelMapper modelMapper;
//	@Autowired
//	private PasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Value("C:/github용/moyda_/src/main/webapp/img/profile")
	private String profileUploadFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	@Value("default.jpg")
	private String defaultProfile;
	
	public Boolean idCheck(String username) {
		return !userDao.existsByHostId(username);
	}

	public Boolean phoneCheck(String email) {
		return !userDao.existsByHostPhone(email);
	}
	
	@Transactional
	public void join(hostJoinRequestDto dto) {
		// dto를 host로 변환
		Host host = modelMapper.map(dto,Host.class);
		MultipartFile sajin = dto.getProfile();
		// 프사를 업로드한 경우 저장, 업로드하지 않은 경우 default.jpg
		if(sajin!=null && sajin.isEmpty()==false) {
			int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
			String extension = sajin.getOriginalFilename().substring(lastIndexOfDot);
			String profile = host.getEmail()+extension;
			host.setProfile(profilePath+profile);
			File profileFile = new File(profileUploadFolder, profile);
			try {
				FileCopyUtils.copy(sajin.getBytes(),profileFile);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			host.setProfile(profilePath+defaultProfile);
		}
		// 랜덤문자열 20자리 checkCode 생성
		String checkCode = RandomStringUtils.randomAlphanumeric(20);
//		host.setPassword(passwordEncoder.encode(host.getPassword())).setCheckCode(checkCode);
		// 비밀번호 암호화
//		host.setPassword(passwordEncoder.encode(dto.getPassword()));
		// 가입 정보와 권한 정보 저장
		userDao.hostJoin(host);
		for(String authority:dto.getAuthorities())
			authorityDao.hostJoin(host.getHostNo(), authority);
		//가입 확인 이메일 메시지 작성
		String link = "<a href='http://localhost:8081/www/host/joinCheck?checkCode="+checkCode+"'";
		StringBuffer stringBuffer = new StringBuffer("<p>회원가입을 위한 안내 메일입니다</p>");
		stringBuffer.append("<p>가입 확인을 위해 아래 링크를 클릭해 주세요</p>").append("<p>로그인 하기 : ").append(link).append("클릭하세요</a></p>");
		String emailMessage = stringBuffer.toString();
		//이메일 발송 : 직접 발송이 아님 gmail을 이용한 간접 발송이기때문에 실패해도 예외가 전달되지 않음
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true, "UTF-8");
			mimeMessageHelper.setFrom(new InternetAddress("webmaster@icia.com"));
			mimeMessageHelper.setTo(host.getEmail());
			mimeMessageHelper.setSubject("가입 안내 메일입니다");
			mimeMessageHelper.setText(emailMessage, true);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	public Boolean joinCheck(String checkCode) {
		User host = userDao.findByCheckCode(checkCode);
		if(host==null)
			return false;
		return userDao.hostupdate(Host.builder().enabled(true).checkCode(checkCode).email(host.getEmail()).build())==1;
	}
	
	public String hostfindId(String nickname,String phone) {
		Host host = userDao.hostfindByPhone(phone);
		if(host!=null && host.getPhone().equals(phone) && host.getNickname().equals(nickname)) {
			String email = host.getEmail();
			return email;
		}
		return null;
	}
	
	
}
