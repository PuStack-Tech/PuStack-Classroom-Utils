package com.pustack.live_session_whiteboard.boardView.utils;

import java.util.HashMap;

public class MapBuilder<Key, Value> {
    private final HashMap<Key, Value> mMap;

    public MapBuilder() {
        mMap = new HashMap<Key, Value>();
    }

    public MapBuilder<Key, Value> put(Key key, Value value) {
        mMap.put(key, value);
        return this;
    }

    public HashMap<Key, Value> build() {
        return mMap;
    }
}
