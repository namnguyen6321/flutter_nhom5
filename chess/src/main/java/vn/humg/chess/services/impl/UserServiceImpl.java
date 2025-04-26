package vn.humg.chess.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.humg.chess.dto.request.UserRequest;
import vn.humg.chess.dto.response.UserResponse;
import vn.humg.chess.entity.User;
import vn.humg.chess.mapping.UserMapping;
import vn.humg.chess.repository.UserRepository;
import vn.humg.chess.services.UserService;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepository userRepository;

    @Override
    public UserResponse getUserInfo(UserRequest request) {
        
        User u=userRepository.findByUsername(request.getUsername()).orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));
        return UserMapping.toResponse(u);
    }

    @Override
    public UserResponse createUser(UserRequest request) {
        User u=new User();
        u.setElo(request.getElo());
        u.setMoney(request.getMoney());
        u.setUsername(request.getUsername());

        try{
            userRepository.save(u);

        }
        catch(Exception e){
            throw new RuntimeException("Người dùng đã tồn tại!");
        }
        return UserMapping.toResponse(u);

    }

    @Override
    public UserResponse editUser(Integer id,UserRequest request) {
        

        if(!userRepository.existsById(id)){
            throw new RuntimeException("Người dùng cần chỉnh sửa không tồn tại");
        }

        User u=new User();
        u.setId(id);
        u.setElo(request.getElo());
        u.setMoney(request.getMoney());
        u.setUsername(request.getUsername());
        try{
            userRepository.save(u);
        }
        catch(Exception e){
            throw new RuntimeException("Tên username mới đã tồn tại ");
        }

        return null;
    }

    @Override
    public UserResponse deleteUser(Integer id) {
        userRepository.deleteById(id);
        return null;        
    }
        
}
