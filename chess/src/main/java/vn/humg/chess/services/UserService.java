package vn.humg.chess.services;

import vn.humg.chess.dto.request.UserRequest;
import vn.humg.chess.dto.response.UserResponse;

public interface UserService {
    UserResponse getUserInfo(UserRequest request);
    UserResponse createUser(UserRequest request);
    UserResponse editUser(Integer id,UserRequest request);
    UserResponse deleteUser(Integer id);
}
