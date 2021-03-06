#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"

USING_NS_CC;

class HelloWorld : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    
    // a selector callback
    virtual void menuCloseCallback(CCObject* pSender);

    // implement the "static node()" method manually
    LAYER_NODE_FUNC(HelloWorld);
    
private:
    cocos2d::CCSpriteBatchNode *_batchNode;
    cocos2d::CCSprite   *_ship;//太空飞船
    
    CCParallaxNode *_backgroundNode;
    CCSprite       *_spacedust1;
    CCSprite       *_spacedust2;
    CCSprite       *_planetsunrise;
    CCSprite       *_galaxy;
    CCSprite       *_spacialanomaly;
    CCSprite       *_spacialanomaly2;
    void    update(cocos2d::ccTime dt);
    
};

#endif // __HELLOWORLD_SCENE_H__
