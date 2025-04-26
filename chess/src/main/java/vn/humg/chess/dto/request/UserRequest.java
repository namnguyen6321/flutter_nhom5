package vn.humg.chess.dto.request;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class UserRequest {



    private String username;

    private Integer elo ;

    private BigDecimal money ;
}
