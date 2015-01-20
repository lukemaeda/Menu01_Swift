import Foundation

class MainScene: CCNode {

    // ラベルの設定
    var label: CCLabelTTF!
    
    override func onEnter() {
        
        label = CCLabelTTF(string: "a", fontName: "Arial", fontSize: 50)
        
        label.string = "メニュー"
        
        label.fontColor = CCColor.whiteColor()
        
        label.position = ccp(280, 240)
        
        self.addChild(label)
        
        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
        // メニューボタンの作成記述
        
        // first buttonの生成
        let calculationButton: CCButton = CCButton .buttonWithTitle("計算ボタン") as CCButton
        calculationButton.setTarget(self, selector:"calculationButtonTouched:")
        
        // second buttonの生成
        let animationButton: CCButton = CCButton .buttonWithTitle("アニメーションボタン") as CCButton
        animationButton.setTarget(self, selector:"animateButtonTouched:")
        
        //let lblA = UILabel()
        //Layout.regist(lblA, superview: self.view)
        
        // layoutboxの生成
        let layoutBox: CCLayoutBox = CCLayoutBox()
        
        // layoutBoxアンカーポイント 中央
        layoutBox.anchorPoint = ccp(0.5, 0.5);
        
        // calculationStepButtonをレイアウトに追加
        layoutBox.addChild(calculationButton)

        // animationButtonをレイアウトに追加
        layoutBox.addChild(animationButton)
        
        // 上部ボタンとの空白
        layoutBox.spacing = 20;
        
        // Vertical:垂直に整列
        layoutBox.direction = CCLayoutBoxDirection.Vertical
        
        // layoutBoxにlayout
        layoutBox.layout()
        
        // cocos2dではCCDirectorを使ってウィンドウサイズを取得
        let size: CCDirector = CCDirector.sharedDirector()
        
        // layoutBoxの表示位置を中央 幅:半分　高さ:半分
        // 座標系が異なります。UIKitは左上が(0,0)、cocos2dは左下が(0,0)です。
        layoutBox.position = ccp(size.designSize.width / 2, size.designSize.height / 2);
        
        // layoutBoxを表示
        self.addChild(layoutBox)

        super.onEnter()
        
    }

    func calculationButtonTouched(CCButton)
    {
        label.string = "計算"
    }
    
    func animateButtonTouched(CCButton)
    {
        label.string = "アニメーション"
    }
}
