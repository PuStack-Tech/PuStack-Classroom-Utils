//
//  WhiteSceneState.h
//  WhiteSDK
//
//  Created by yleaf on 2019/2/25.

#import "WhiteObject.h"
#import "WhiteScene.h"

NS_ASSUME_NONNULL_BEGIN

/** Scene State
 * If multiple windows are enabled, you need to check the status change of the number of main whiteboard pages. This object is no longer valid and needs to be checked 
 * [WhitePageState](WhitePageState) */
@interface WhiteSceneState : WhiteObject

/** A list of all scenes under the current scene group. */
@property(nonatomic, nonnull, strong, readonly) NSArray<WhiteScene *> *scenes;
/** The path of the current scene (scene directory + current scene name). */
@property(nonatomic, nonnull, strong, readonly) NSString *scenePath;
/** The index number of the current scene in the scene group to which it belongs */
@property(nonatomic, assign, readonly) NSInteger index;

@end

NS_ASSUME_NONNULL_END
