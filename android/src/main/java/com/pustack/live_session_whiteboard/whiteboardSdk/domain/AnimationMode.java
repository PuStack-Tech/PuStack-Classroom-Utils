package com.pustack.live_session_whiteboard.whiteboardSdk.domain;

import com.google.gson.annotations.SerializedName;

/**
 * 移动或缩放视角时的动画模式。
 *
 * @since 2.3.2
 */
public enum AnimationMode {
    /**
     * （默认）渐变模式。
     */
    @SerializedName("continuous")
    Continuous,
    /**
     * 瞬间切换模式。
     */
    @SerializedName("immediately")
    Immediately
}
