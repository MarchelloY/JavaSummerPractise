package com.marchello.model;

import javax.persistence.*;

@Entity
@Table(name = "card_list")
public class Card {
    @Id
    @GeneratedValue
    @Column(name = "card_id")
    private Long id;

    @Column(name = "card_url")
    private String url;
    @Column(name = "card_value")
    private int value;

    public Card(){}

    public Card(String url, int value){
        this.url = url;
        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
