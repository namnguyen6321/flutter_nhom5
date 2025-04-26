package vn.humg.chess.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.humg.chess.dto.request.UserRequest;
import vn.humg.chess.dto.response.ApiResponse;
import vn.humg.chess.dto.response.UserResponse;
import vn.humg.chess.entity.User;
import vn.humg.chess.services.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;




@RestController
@RequestMapping("/api/user")
public class UserController {
    
    @Autowired
    UserService userService;
    
    @PostMapping("/info")
    public ApiResponse<UserResponse> getUsers(@RequestBody UserRequest request) {
        return ApiResponse.<UserResponse>builder()
        .data(userService.getUserInfo(request))
        .code(200)
        .build();
    }

    @PostMapping("/create")
    public ApiResponse<UserResponse> postMethodName(@RequestBody UserRequest request) {

        return ApiResponse.<UserResponse>builder()
        .data(userService.createUser(request))
        .code(200)
        .build();
    }

    @PutMapping("/update/{id}")
    public ApiResponse<UserResponse> putMethodName(@PathVariable Integer id, @RequestBody UserRequest request) {
    
        return ApiResponse.<UserResponse>builder()
        .data(userService.editUser(id,request))
        .code(200)
        .build();
    }
    @DeleteMapping("/delete/{id}")
    public ApiResponse<UserResponse> putMethodName(@PathVariable Integer id) {
    
        return ApiResponse.<UserResponse>builder()
        .data(userService.deleteUser(id))
        .code(200)
        .build();
    }

}
