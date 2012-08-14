package com.testapp

class Role {

    String name
    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        name blank: false
        authority blank: false, unique: true
    }
}
