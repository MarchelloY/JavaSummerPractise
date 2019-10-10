package com.marchello.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "room_list")
public class Room {
    @Id
    @GeneratedValue
    @Column(name = "room_id")
    private Long id;

    @Column(name = "room_name")
    private String name;
    @Column(name = "room_date")
    private Date date;
    @Column(name="room_author")
    private String author;

    public Room(String name, Date date, String author) {
        this.name = name;
        this.date = date;
        this.author = author;
    }

    public Room() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
