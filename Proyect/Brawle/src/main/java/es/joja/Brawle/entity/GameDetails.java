package es.joja.Brawle.entity;

import java.io.Serializable;

public class GameDetails implements Serializable {
    Game game;
    int numTries;
    boolean guessed;

    public GameDetails() {
    }

    public GameDetails(Game game, int numTries, boolean guessed) {
        this.game = game;
        this.numTries = numTries;
        this.guessed = guessed;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public int getNumTries() {
        return numTries;
    }

    public void setNumTries(int numTries) {
        this.numTries = numTries;
    }

    public boolean isGuessed() {
        return guessed;
    }

    public void setGuessed(boolean guessed) {
        this.guessed = guessed;
    }
}
