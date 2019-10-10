package com.marchello.repo;

import com.marchello.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepo extends JpaRepository<Room, Long> {
    Room findByName(String name);
}
