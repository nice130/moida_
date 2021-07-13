package com.moyda.www.userService;

import java.io.*;
import java.text.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.scheduling.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;
import com.moyda.www.dao.*;
import com.moyda.www.dto.*;
import com.moyda.www.dto.UserDto.*;
import com.moyda.www.entity.*;

@Service
public class UserService {
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
	
	public Boolean idCheck(String email) {
		return !userDao.existsById(email);
	}

	public Boolean phoneCheck(String email) {
		return !userDao.existsById(email);
	}
	
	@Transactional
	public void join(JoinRequestDto dto) {
		// dto를 user로 변환
		User user = modelMapper.map(dto,User.class);
		MultipartFile sajin = dto.getProfile();
		// 프사를 업로드한 경우 저장, 업로드하지 않은 경우 default.jpg
		if(sajin!=null && sajin.isEmpty()==false) {
			int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
			String extension = sajin.getOriginalFilename().substring(lastIndexOfDot);
			String profile = user.getEmail()+extension;
			user.setProfile(profilePath+profile);
			File profileFile = new File(profileUploadFolder, profile);
			try {
				FileCopyUtils.copy(sajin.getBytes(),profileFile);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			user.setProfile(profilePath+defaultProfile);
		}
		// 랜덤문자열 20자리 checkCode 생성
		String checkCode = RandomStringUtils.randomAlphanumeric(20);
//		user.setPassword(passwordEncoder.encode(user.getPassword())).setCheckCode(checkCode);
		
		
		// 비밀번호 암호화
//		user.setPassword(passwordEncoder.encode(user.getPassword())).setCheckCode(checkCode);

		// 가입 정보와 권한 정보 저장
		userDao.userJoin(user);
		for(String authority:dto.getAuthorities())
			authorityDao.userJoin(user.getUserNo(), authority);
		//가입 확인 이메일 메시지 작성
		String link = "<a href='http://localhost:8081/www/user/joinCheck?checkCode="+checkCode+"'";
		StringBuffer stringBuffer = new StringBuffer("<p>회원가입을 위한 안내 메일입니다</p>");
		stringBuffer.append("<p>가입 확인을 위해 아래 링크를 클릭해 주세요</p>").append("<p>로그인 하기 : ").append(link).append("클릭하세요</a></p>");
		String emailMessage = stringBuffer.toString();
		//이메일 발송 : 직접 발송이 아님 gmail을 이용한 간접 발송이기때문에 실패해도 예외가 전달되지 않음
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true, "UTF-8");
			mimeMessageHelper.setFrom(new InternetAddress("webmaster@icia.com"));
			mimeMessageHelper.setTo(user.getEmail());
			mimeMessageHelper.setSubject("가입 안내 메일입니다");
			mimeMessageHelper.setText(emailMessage, true);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public Boolean joinCheck(String checkCode) {
		User user = userDao.findByCheckCode(checkCode);
		if(user==null)
			return false;
		return userDao.update(User.builder().enabled(true).checkCode(checkCode).email(user.getEmail()).build())==1;
	}
	
	public String userfindId(String irum,String phone) {
		User user = userDao.userfindByPhone(phone);
		System.out.println(user);
		if(user!=null && user.getPhone().equals(phone) && user.getIrum().equals(irum)) {
			System.out.println(user.getEmail());
			String email = user.getEmail();
			return email;
		}
		return null;
	}
	
	
//	public Boolean resetPwd(String email, String irum) {
//		User user = userDao.findById(irum);
//		if(user!=null && user.getEmail().equals(email)) {
//			/*
//			 && : 논리 곱
//			 || : 논리 합
//			 
//			  */
//			String newPassword = RandomStringUtils.randomAlphanumeric(20); //사용자 비밀번호에 접근할 수 없으므로 임시비밀번호 발급
//			userDao.update(User.builder().irum(irum).password(passwordEncoder.encode(newPassword)).build());
//			// 가입 확인 이메일 메시지 작성
//			String link = "<a href='http://localhost:8081/rboard2/user/login'>";
//			StringBuffer stringBuffer = new StringBuffer("<h1>임시 비밀번호 발급</h1>");
//			stringBuffer.append("<p>임시비밀번호 : " + newPassword + "</p>");
//			String emailMessage = stringBuffer.toString();
//			
//			// 이메일 발송 : 직접 발송이 아니라 gmail을 이용한 간접 발송이므로 발송이 실패해도 실제 예외가 전달되지는 않는다
//			try {
//				MimeMessage message = javaMailSender.createMimeMessage();
//				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true, "UTF-8");
//				mimeMessageHelper.setFrom(new InternetAddress("webmaster@icia.com"));
//				mimeMessageHelper.setTo(user.getEmail());
//				mimeMessageHelper.setSubject("임시비밀번호 발급 메일입니다");
//				mimeMessageHelper.setText(emailMessage, true);
//				javaMailSender.send(message);
//			} catch (MessagingException e) {
//				e.printStackTrace();
//			}
//			return true;
//		}
//		return false; //아이디나 비밀번호가 틀린경우 모두 실패
//	}
	
//	public Boolean pwdCheck(String password, String email) {
//		User user = userDao.tfindById(email);
//		if(user==null)
//			return false;
//		return passwordEncoder.matches(password, user.getPassword());
//	}
	
	public Boolean update(UserDto.UpdateRequestDto dto) {
		User user = modelMapper.map(dto, User.class);
		MultipartFile sajin = dto.getProfile();
		if(sajin!=null && sajin.isEmpty()==false) {
			int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
			String extension = sajin.getOriginalFilename().substring(lastIndexOfDot);
			String profile = user.getEmail() + extension;
			user.setProfile(profilePath + profile); 
			File profileFile = new File(profileUploadFolder, profile);
			try {
				FileCopyUtils.copy(sajin.getBytes(), profileFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		
//		if(dto.getNewPassword()!=null) {
//			String newPassword = dto.getNewPassword();
//			user.setPassword(passwordEncoder.encode(newPassword));
//		}
		return userDao.update(user)==1;
	}
	
	
}
