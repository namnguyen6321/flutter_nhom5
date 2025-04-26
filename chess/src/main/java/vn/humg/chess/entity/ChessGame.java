package vn.humg.chess.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "chess_game")
public class ChessGame {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "player_white")
    private User playerWhite;

    @ManyToOne
    @JoinColumn(name = "player_black")
    private User playerBlack;

    @Column(name = "is_playing")
    private Boolean isPlaying = true;

    @ManyToOne
    @JoinColumn(name = "winner")
    private User winner;

    // Getters and Setters
}
