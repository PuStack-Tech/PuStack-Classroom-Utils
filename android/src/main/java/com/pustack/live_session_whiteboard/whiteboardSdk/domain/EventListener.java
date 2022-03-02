package com.pustack.live_session_whiteboard.whiteboardSdk.domain;

/**
 * `EventListener` 接口类，用于监听自定义事件。
 */
public interface EventListener {
    /**
     * 收到监听的事件回调。
     *
     * @param eventEntry 监听的事件，详见 {@link EventEntry}。
     */
    void onEvent(EventEntry eventEntry);
}
