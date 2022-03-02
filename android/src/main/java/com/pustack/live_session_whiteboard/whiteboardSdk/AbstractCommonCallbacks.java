package com.pustack.live_session_whiteboard.whiteboardSdk;

import org.json.JSONObject;

import com.pustack.live_session_whiteboard.whiteboardSdk.domain.SDKError;

/**
 * `CommonCallbacks` 接口的缺省（空）实现。详见 {@link CommonCallbacks CommonCallbacks}。
 *
 * @deprecated 已废弃。空实现类由用户应用处理
 */
@Deprecated
public class AbstractCommonCallbacks implements CommonCallbacks {

    /**
     * SDK 出现未捕获的全局错误回调。
     *
     * @param args 错误信息。
     */
    @Override
    public void throwError(Object args) {

    }

    /**
     * 图片 URL 拦截回调。
     *
     * @since 2.9.14
     *
     * 该回调默认禁用。你可以在初始化白板 SDK 时，通过 {@link WhiteSdkConfiguration#setEnableInterrupterAPI setEnableInterrupterAPI}(true) 方法开启。
     *
     * 开启后，在白板中插入图片时，SDK 会触发该回调，报告图片的原 URL 地址。你可以在该回调中将原 URL 地址替换成指定的 URL 地址。
     *
     * @note
     * 开启后，SDK 会频繁触发该回调，因此 Agora 不推荐开启该回调；在 Android 平台，你可以使用 WebView 的拦截功能进行 URL 拦截。
     *
     * @param sourceUrl 原 URL 地址。
     *
     * @return 替换后的 URL 地址。请确保在返回值中进行传参。
     */
    @Override
    public String urlInterrupter(String sourceUrl) {
        return sourceUrl;
    }

    /**
     * 播放动态 PPT 中的音视频回调。
     *
     * @since 2.9.13
     */
    @Override
    public void onPPTMediaPlay() {

    }

    /**
     * 暂停播放动态 PPT 中的音视频回调。
     *
     * @since 2.9.13
     */
    @Override
    public void onPPTMediaPause() {

    }

    /**
     * 接收到网页发送的消息回调。
     *
     * @since 2.11.4
     *
     * 当本地用户收到了网页（如 iframe 插件、动态 PPT）发送的消息时会触发该回调。
     *
     * @note 不保证所有用户都能接收到该回调。
     *
     * @param message JSON 格式的消息。只有当消息为 JSON 格式时，本地用户才能收到。
     */
    @Override
    public void onMessage(JSONObject message) {

    }

    /**
     * SDK 初始化失败回调。
     *
     * @since 2.9.14
     *
     * 如果 SDK 初始化失败，调用加入实时房间或回放房间时会处于一直无响应状态，需要重新初始化 SDK。
     * SDK 初始化失败可能由以下原因导致：
     * - 初始化 SDK 时候，网络异常，导致获取配置信息失败。
     * - 传入了不合法的 App Identifier。
     *
     */
    @Override
    public void sdkSetupFail(SDKError error) {

    }
}
