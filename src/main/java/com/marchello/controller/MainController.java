package com.marchello.controller;

import com.marchello.model.Card;
import com.marchello.model.Room;
import com.marchello.model.User;
import com.marchello.repo.CardRepo;
import com.marchello.repo.RoomRepo;
import com.marchello.repo.UserRepo;
import com.marchello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoomRepo roomRepo;

    @Autowired
    private CardRepo cardRepo;

    @Autowired
    private UserRepo userRepo;

    private List<Card> allCards = new ArrayList<>();
    private List<Card> cardsPlayer = new ArrayList<>();
    private List<Card> cardsPC = new ArrayList<>();
    private int result = 0, resultPC = 0;

    @RequestMapping
    public String home(Model model,
                       HttpServletRequest request
    ){
        model.addAttribute("name", request.getUserPrincipal().getName());
        return "home";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user) {
        if (!userService.addUser(user)) {
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/create")
    public String create() {
        return "create";
    }

    @PostMapping("/create")
    public String addRoom(@RequestParam String name,
                          HttpServletRequest request
    ) {
        if (roomRepo.findByName(name) != null || Objects.equals(name, "")) {
            return "create";
        }
        Room room = new Room(name, new Date(), request.getUserPrincipal().getName());
        roomRepo.save(room);
        return "redirect:/rooms";
    }

    @GetMapping("/rooms")
    public String rooms(Model model) {
        model.addAttribute("rooms", roomRepo.findAll());
        return "rooms";
    }

    @GetMapping("/rooms/{room}")
    public String room(@PathVariable Long room, Model model){
        this.allCards.clear();
        this.cardsPC.clear();
        this.allCards = cardRepo.findAll();
        this.resultPC = 0;

        while (this.resultPC < 17) {
            Card newCard = this.allCards.get((int) (Math.random() * this.allCards.size()));
            this.cardsPC.add(newCard);
            this.allCards.remove(newCard);
            if (this.cardsPC.size() < 8) {
                this.resultPC = 0;
            }
            for (Card card : this.cardsPC) {
                if (this.cardsPC.size() < 8) {
                    this.resultPC += card.getValue();
                }
            }
        }
        model.addAttribute("sizePC", (this.cardsPC.size()+1));
        model.addAttribute("resultPC", this.resultPC);
        model.addAttribute("cardsPC", this.cardsPC);
        model.addAttribute("result", this.result = 0);
        model.addAttribute("numRoom", room);
        model.addAttribute("flag",false);
        model.addAttribute("winlose", -1);
        cardsPlayer.clear();
        return "game";
    }

    @PostMapping("/rooms/{room}")
    public String drawCard(@PathVariable Long room, Model model){
        Card newCard = this.allCards.get((int) (Math.random() * this.allCards.size()));
        this.cardsPlayer.add(newCard);
        this.allCards.remove(newCard);
        if(this.cardsPlayer.size() < 8){
            this.result = 0;
        }
        for (Card card : this.cardsPlayer) {
            if (this.cardsPlayer.size() < 8) {
                this.result += card.getValue();
            }
        }
        model.addAttribute("result", this.result);
        model.addAttribute("size", (this.cardsPlayer.size()+1));
        model.addAttribute("cards", this.cardsPlayer);
        model.addAttribute("numRoom", room);
        model.addAttribute("sizePC", (this.cardsPC.size()+1));
        model.addAttribute("resultPC", this.resultPC);
        model.addAttribute("cardsPC", this.cardsPC);
        model.addAttribute("flag",false);
        model.addAttribute("winlose", -1);
        return "game";
    }

    @PostMapping("/rooms/{room}/result")
    public String result(@PathVariable Long room, Model model, HttpServletRequest request) {
        User user = (User) userService.loadUserByUsername(request.getUserPrincipal().getName());
        int wins = user.getWins();
        int loses = user.getLoses();
        model.addAttribute("result", this.result);
        model.addAttribute("size", (this.cardsPlayer.size()+1));
        model.addAttribute("cards", this.cardsPlayer);
        model.addAttribute("numRoom", room);
        model.addAttribute("sizePC", (this.cardsPC.size()+1));
        model.addAttribute("resultPC", this.resultPC);
        model.addAttribute("cardsPC", this.cardsPC);
        model.addAttribute("flag",true);
        if ((this.result > 21 && this.resultPC > 21) || this.result == this.resultPC){
            model.addAttribute("winlose", 2);
        }
        if (this.result > 21 && this.resultPC <= 21) {
            model.addAttribute("winlose", 0);
            user.setLoses(loses + 1);
        }
        if (this.resultPC > 21 && this.result <= 21) {
            model.addAttribute("winlose", 1);
            user.setWins(wins + 1);
        }
        if (this.result > this.resultPC && this.result <= 21) {
            model.addAttribute("winlose", 1);
            user.setWins(wins + 1);
        }
        if (this.result < this.resultPC && this.resultPC <= 21) {
            model.addAttribute("winlose", 0);
            user.setLoses(loses + 1);
        }
        userRepo.save(user);
        return "game";
    }

    @GetMapping("/profile")
    public String profile (Model model, HttpServletRequest request) {
        User user = (User) userService.loadUserByUsername(request.getUserPrincipal().getName());
        model.addAttribute("wins", user.getWins());
        model.addAttribute("loses", user.getLoses());
        return "profile";
    }
}