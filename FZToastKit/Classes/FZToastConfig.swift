//
//  FZToastConfig.swift
//  FZToastKit
//
//  Created by Jack on 2023/2/13.
//

import Foundation

public class FZToastManager {
    
    // 使用单例管理全局配置项
    public static let shared = FZToastManager()

    // 吐丝配置项
    public var config = FZToastConfig()
}

public struct FZToastConfig {
        
    /// hud背景圆角，默认为15.0
    public var cornerRadius: CGFloat = 15.0
    
    /// 遮罩颜色，遮挡屏幕视图层的透明度，默认透明, 需要传(0 ~ 1)之间的参数
    public var bgViewAlpha: CGFloat = 0.0
    
    /// 文字颜色，默认为白色
    public var textColor = UIColor.white
    
    /// 文字对其方式，默认为居中对齐
    public var textAlignment_type = NSTextAlignment.center
    
    /// 字体样式和大小 默认15号 应用于带图片的加载框
    public var sizeFont_hud = UIFont.systemFont(ofSize: 15)
    
    /// 上部间距默认是15 带图片的
    public var paddingTop_hud: CGFloat = 15
    
    /// 下部间距默认是15 带图片的
    public var paddingBottom_hud: CGFloat = 15
    
    /// 左部间距默认是15 带图片的
    public var paddingLeft_hud: CGFloat = 15
    
    /// 右部间距默认是15 带图片的
    public var paddingRight_hud: CGFloat = 15
    
    /// 背景距离视图中心上下的偏移量
    public var offsetCenterY_hud: CGFloat = 0
    
    /// 图片文字展示的方式是水平还是竖直展示，默认竖直展示（图片在上，文字在下）
    public var verticalType: Bool = true
    
    /// 图片文字展示的方式是水平还是竖直展示，默认竖直展示（图片在上，文字在下）
    public var hideDelay: Double = 0
    
    public init() {}

}
