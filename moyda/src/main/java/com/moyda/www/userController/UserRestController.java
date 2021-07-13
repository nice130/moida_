package com.moyda.www.userController;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;

import com.moyda.www.dto.UserDto.*;
import com.moyda.www.userService.*;

@RestController
public class UserRestController {
	@Autowired
	private UserService service;
	
	@PreAuthorize("isAnonymous()")
	@GetMapping(path="/user/idCheck", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> idCheck(@RequestParam String email) {
		if(service.idCheck(email)==true)
			return ResponseEntity.ok("사용가능한 아이디입니다");
		return ResponseEntity.status(HttpStatus.CONFLICT).body("사용중인 아이디입니다");
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping(path="/user/phoneCheck", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> pwdCheck(@RequestParam String phone) {
		if(service.phoneCheck(phone)==true)
			return ResponseEntity.ok("사용가능한 이메일입니다");
		return ResponseEntity.status(HttpStatus.CONFLICT).body("사용중인 이메일입니다");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/user/update")
	public ResponseEntity<?> update(UpdateRequestDto dto, Principal principal) {
		dto.setEmail(principal.getName());
		System.out.println(dto);
		if(service.update(dto)==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}

}
