#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

using namespace cocos2d;
using namespace CocosDenshion;

CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::node();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::node();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }

//    /////////////////////////////
//    // 2. add a menu item with "X" image, which is clicked to quit the program
//    //    you may modify it.
//
//    // add a "close" icon to exit the progress. it's an autorelease object
//    CCMenuItemImage *pCloseItem = CCMenuItemImage::itemWithNormalImage(
//                                        "CloseNormal.png",
//                                        "CloseSelected.png",
//                                        this,
//                                        menu_selector(HelloWorld::menuCloseCallback) );
//    pCloseItem->setPosition( ccp(CCDirector::sharedDirector()->getWinSize().width - 20, 20) );
//
//    // create menu, it's an autorelease object
//    CCMenu* pMenu = CCMenu::menuWithItems(pCloseItem, NULL);
//    pMenu->setPosition( CCPointZero );
//    this->addChild(pMenu, 1);
//
//    /////////////////////////////
//    // 3. add your codes below...
//
//    // add a label shows "Hello World"
//    // create and initialize a label
//    CCLabelTTF* pLabel = CCLabelTTF::labelWithString("Hello World", "Thonburi", 34);
//
//    // ask director the window size
//    CCSize size = CCDirector::sharedDirector()->getWinSize();
//
//    // position the label on the center of the screen
//    pLabel->setPosition( ccp(size.width / 2, size.height - 20) );
//
//    // add the label as a child to this layer
//    this->addChild(pLabel, 1);
//
//    // add "HelloWorld" splash screen"
//    CCSprite* pSprite = CCSprite::spriteWithFile("HelloWorld.png");
//
//    // position the sprite on the center of the screen
//    pSprite->setPosition( ccp(size.width/2, size.height/2) );
//
//    // add the sprite as a child to this layer
//    this->addChild(pSprite, 0);
    
    _batchNode = CCSpriteBatchNode::batchNodeWithFile("Sprites.pvr.ccz");//Sprites.pvr.ccz 用Texture packer工具编译
    this->addChild(_batchNode);
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Sprites.plist");
    
    //获取窗口尺寸
    CCSize winSize = CCDirector::sharedDirector()->getWinSize();
    //加入太空飞船
    _ship = CCSprite::spriteWithSpriteFrameName("SpaceFlier_sm_1.png");
    _ship->setPosition(ccp(winSize.width*0.1, winSize.height*0.5));
    this->addChild(_ship,1);
    
    //加入背景
    _backgroundNode = CCParallaxNode::node();
    this->addChild(_backgroundNode, -1);
    
    _spacedust1 = CCSprite::spriteWithFile("bg_front_spacedust.png");
    _spacedust2 = CCSprite::spriteWithFile("bg_front_spacedust.png");
    _planetsunrise = CCSprite::spriteWithFile("bg_planetsunrise.png");
    _galaxy = CCSprite::spriteWithFile("bg_galaxy.png");
    _spacialanomaly = CCSprite::spriteWithFile("bg_spacialanomaly.png");
    _spacialanomaly2 = CCSprite::spriteWithFile("bg_spacialanomaly2.png");
    
    //设置背景滚动速度
    CCPoint dustSpeed = ccp(0.1, 0.1);
    CCPoint bgSpeed = ccp(0.05, 0.05);
    
    
    _backgroundNode->addChild(_spacedust1, 0, dustSpeed, ccp(0, winSize.height/2));
    _backgroundNode->addChild(_spacedust2, 0, dustSpeed, ccp(_spacedust1->getContentSize().width, winSize.height/2));
    _backgroundNode->addChild(_galaxy, -1, bgSpeed, ccp(0,winSize.height*0.7));
    _backgroundNode->addChild(_planetsunrise, -1, bgSpeed, ccp(600, winSize.height*0.1));
    _backgroundNode->addChild(_spacialanomaly, -1, bgSpeed, ccp(900, winSize.height*0.3));
    _backgroundNode->addChild(_spacialanomaly2, -1, bgSpeed, ccp(1500, winSize.height*0.9));
    
    
    
    
    
    
    return true;
}

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
    CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}
