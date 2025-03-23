#import "UI.h"

ModMenu *menu;

#define Version @"1.0.0"          // アプリのバージョン
#define Author @"RHgrive"        // 作成者名
#define DebugMode NO       
#define WAIT 1.5                 // ModMenuの遅延起動時間（秒）

void setupOptions(ModMenu *menu) {
    [menu addSlider:@"速度調整" 
        initialValue:50 
            minValue:0 
            maxValue:100 
         forCategory:0];
    
    [menu addToggle:@"機能有効化" initialValue:YES forCategory:0];
    
    // カテゴリ2（UIテーマ）にテーマ切替ボタンを追加
    [menu addButton:@"テーマ切替" 
             icon:@"paintbrush.fill" 
         callback:^{
             [menu setTheme:ModMenuThemeNeon animated:YES]; // 例：ネオンテーマ
         } 
      forCategory:2];
}

// クイックアクションのセットアップ
void setupQuickActions(ModMenu *menu) {
    [menu addQuickAction:@"リセット" 
                  icon:@"arrow.counterclockwise" 
                action:^{
                    [menu resetAllSettings];
                }];
    
    [menu addQuickAction:@"保存" 
                  icon:@"square.and.arrow.down" 
                action:^{
                    [menu saveSettings];
                }];
}

// ModMenuの全体設定
void setupModMenu() {
    menu = [ModMenu shared]; // ModMenuのインスタンス生成
    
    // ウェルカムメッセージ（アプリ名はビルド時に置き換え可能）
    [menu showMessage:[NSString stringWithFormat:@"%@ Mod Menu %@", Version, @@APPNAME@@]
             duration:3.0 
              credits:[NSString stringWithFormat:@"by %@", Author]];
    
    // UIテーマとレイアウトの設定
    [menu setTheme:ModMenuThemeMonochrome animated:YES]; // モノクロームテーマ
    [menu switchTo:ModMenuLayoutRadial animated:YES];     // 円形レイアウト
    
    // カテゴリタイトルとアイコンの設定
    [menu setContainerTitle:@"基本設定" forCategory:0];
    [menu setContainerTitle:@"進階設定" forCategory:1];
    [menu setContainerTitle:@"UIテーマ" forCategory:2];
    [menu setCategoryIcon:@"gearshape" forCategory:0];
    [menu setCategoryIcon:@"star" forCategory:1];
    [menu setCategoryIcon:@"paintbrush" forCategory:2];
    
    // デフォルトオプションの追加（デバッグ用）
    [menu addDefaultOptions:DebugMode];
    
    // オプションとクイックアクションの適用
    setupOptions(menu);
    setupQuickActions(menu);
}

// メインの起動処理（IL2CPP関連を削除）
void waitBeforeLaunch() {
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(WAIT * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
            setupModMenu(); // ModMenuの設定のみ実行
        });
}

// アプリ起動イベントのリスナー
static void didFinishLaunching(CFNotificationCenterRef center, void *observer,
                               CFStringRef name, const void *object,
                               CFDictionaryRef info) {
    waitBeforeLaunch();
}

// アプリ起動時に自動実行
void launchEvent() {
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetLocalCenter(), NULL, &didFinishedLaunching,
        (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL,
        CFNotificationSuspensionBehaviorDrop);
}

// コンストラクタ（自動実行）
__attribute__((constructor)) static void initialize() {
    launchEvent();
}
