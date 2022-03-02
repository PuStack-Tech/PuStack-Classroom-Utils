package com.pustack.live_session_whiteboard.whiteboardSdk.domain;

/**
 * 场景状态。
 */
public class SceneState extends WhiteObject {

    private Scene[] scenes;
    private String scenePath;
    private String sceneName;
    private String contextPath;
    private int index;

    /**
     * 获取当前场景组下所有场景的列表。
     *
     * @return 当前场景组下所有场景的列表。
     */
    public Scene[] getScenes() {
        return scenes;
    }

    /**
     * 获取当前场景的路径。
     *
     * @return 当前场景的路径。
     */
    public String getScenePath() {
        return scenePath;
    }

    /**
     * 获取当前场景在所属场景组中的索引号。
     *
     * @return 当前场景在所属场景组中的索引号。
     */
    public int getIndex() {
        return index;
    }

    /**
     * 获取当前场景的名称。
     *
     * @return 当前场景的名称
     */
    public String getSceneName() {
        return sceneName;
    }

    /**
     * 获取当前场景的目录。
     *
     * @return 当前场景的目录
     */
    public String getContextPath() {
        return contextPath;
    }
}
