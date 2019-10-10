package com.marchello.game;

public class Card {
    private String url;
    private int value;

    public Card(String url, int value){
        this.url = url;
        this.value = value;
    }

    public Card(){}

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
