package com.parking.parking_lot.common;

public class UserDto {
    Long id;
    String username;
    String password;
    String email;

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public UserDto(Long id, String name, String password, String email) {
        this.id = id;
        this.username = name;
        this.password = password;
        this.email = email;
    }
}
