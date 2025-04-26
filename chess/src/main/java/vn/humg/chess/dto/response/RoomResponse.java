package vn.humg.chess.dto.response;

import lombok.Data;

@Data
public class RoomResponse {
     private Integer id;

    private String roomName;


    private Boolean isActive = true;
}
