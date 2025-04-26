package vn.humg.chess.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "game_history")
public class GameHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "game_id")
    private ChessGame game;

    @ManyToOne
    @JoinColumn(name = "player_id")
    private User player;

    @ManyToOne
    @JoinColumn(name = "move_id")
    private Move move;

    // Getters and Setters
}
