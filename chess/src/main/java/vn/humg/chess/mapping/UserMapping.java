package vn.humg.chess.mapping;

import vn.humg.chess.dto.response.UserResponse;
import vn.humg.chess.entity.User;

public class UserMapping {

    public static UserResponse toResponse(User user) {
        return new UserResponse(
            user.getId(),
            user.getUsername(),
            user.getElo(),
            user.getMoney()
        );
    }
}
