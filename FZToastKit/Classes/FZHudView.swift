//
//  FZHudView.swift
//  FZToastKit
//
//  Created by Jack on 2023/2/13.
//

import UIKit
import FZCommonKit

// 外部调用的方法
extension FZHudView {

    public enum Status {
        case normal  /// 无状态，显示纯文字
        case loading /// 正在加载
        case succeed /// 提交成功
        case error /// 提交失败
        case netWorkError  /// 网络连接失败
        case custom /// 自定义，显示自定义的 icon
    }

    /// 展示loading加载进程的菊花
    public func showIpadLoadingHUD(_ title: String = "") {
        var config = FZToastConfig()
        config.paddingLeft_hud = 35.fit
        config.paddingRight_hud = 35.fit
        config.paddingTop_hud = 35.fit
        config.paddingBottom_hud = 35.fit
        config.sizeFont_hud = 12.mediumPFFont
        config.offsetCenterY_hud = -40.fit
        config.verticalType = true
        FZToastManager.shared.config = config
        showHUD(message: title, hideDelay: 0)
    }

    /// 展示提示文字
    public func showIpadTextHUD(_ title: String) {
        var config = FZToastConfig()
        config.paddingTop_hud = 28.fit
        config.paddingBottom_hud = 28.fit
        config.paddingLeft_hud = 85.fit
        config.paddingRight_hud = 85.fit
        config.sizeFont_hud = 12.mediumPFFont
        config.offsetCenterY_hud = -40.fit
        config.verticalType = false
        FZToastManager.shared.config = config
        showText(title)
    }

    /// 提示成功的图片 Ipad专有
    public func showIpadPaySuccessHUD(_ title: String) {
        var config = FZToastConfig()
        config.paddingTop_hud = 28.fit
        config.paddingBottom_hud = 28.fit
        config.paddingLeft_hud = 85.fit
        config.paddingRight_hud = 85.fit
        config.sizeFont_hud = 12.mediumPFFont
        config.offsetCenterY_hud = -40.fit
        config.verticalType = true
        FZToastManager.shared.config = config
        let icon = getImage(name: "pay_success")
        guard let icon = icon else { return  }
        showCustomIconHUD(customIcon: icon, message: title, hideDelay: -1)
    }

    /// 提示支付中信息 Ipad专有
    public func showIpadPayingIconHUD(_ title: String) {
        var config = FZToastConfig()
        config.paddingTop_hud = 28.fit
        config.paddingBottom_hud = 28.fit
        config.paddingLeft_hud = 85.fit
        config.paddingRight_hud = 85.fit
        config.sizeFont_hud = 12.regularPFFont
        config.offsetCenterY_hud = -40.fit
        config.verticalType = false
        FZToastManager.shared.config = config
        let icon = getImage(name: "paying_icon")
        guard let icon = icon else { return }
        showCustomIconHUD(customIcon: icon, message: title, hideDelay: 1.5)
    }

    // MARK: - APIs
    /// message: 需要显示的文字提示
    /// delay: 默认1.5秒后隐藏, 如需修改请传参
    public func showText(_ message: String, hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        showMsg(message: message, hideDelay: delay)
    }

    /// 提交成功
    /// delay: 默认1.5秒后隐藏, 如需修改请传参
    public func showSuccessHUD(hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .succeed
        self.message = "提交成功"
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    /// 提交失败
    /// delay: 默认1.5秒后隐藏, 如需修改请传参
    public func showErrorHUD(hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .error
        self.message = "提交失败"
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    /// 网络连接失败
    /// delay: 默认1.5秒后隐藏, 如需修改请传参
    public func showNetworkErrorHUD(hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .netWorkError
        self.message = "网络连接失败"
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    /// 正在加载...
    /// delay: 默认1.5秒后隐藏, 如需修改请传参
    public func showLoadingHUD(hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .loading
        self.message = "正在加载..."
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    /// 显示菊花
    /// status: 显示的状态，默认为 loading
    /// message: 状态说明文字，默认为 nil
    /// hideDelay: 一段时间后自动隐藏，单位秒，默认0，此时不会自动隐藏
    public func showHUD(message: String? = nil, hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .loading
        self.message = message
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    /// 显示自定义图标
    ///
    /// - Parameters:
    ///   - customIcon: 自定义图标，传入想要替换的图片
    ///   - message: 状态文字，默认为 nil
    ///   - delay: 一段时间后自动隐藏，单位秒，默认0，此时不会自动隐藏
    public func showCustomIconHUD(customIcon: UIImage, message: String? = nil, hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.customIcon = customIcon
        self.status = .custom
        self.message = message
        updateStatusShow()

        if delay > 0 {
            needDelay(delay: delay)
        }
    }


    /// status: 显示的状态，默认为 normal
    /// message: 状态说明文字，默认为 nil
    /// hideDelay: 自动隐藏为1.5
    private func showMsg(message: String? = nil, hideDelay delay: Double = FZToastManager.shared.config.hideDelay) {
        self.status = .normal
        self.message = message
        updateStatusShow()
        if delay == 0 {
            needDelay(delay: 1.5)
        }

        if delay > 0 {
            needDelay(delay: delay)
        }
    }

    public func hiddenHUD() {
        hideHUD()
    }

    private func needDelay(delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            self.hiddenHUD()
        })
    }
}

public class FZHudView: UIView {
    @IBOutlet weak var bgView: UIView!  /// 覆盖到整个屏幕的背景，防止加载过程中被点击
    @IBOutlet weak var hudBgView: UIView!  /// 提示框的半透明黑色背景
    @IBOutlet weak var iconImV: UIImageView!  /// 显示提示的图片
    @IBOutlet weak var messageLab: UILabel!  /// 提示的内容

    @IBOutlet weak var stackView: UIStackView! /// 内容视图
    @IBOutlet weak var stackViewTopConst: NSLayoutConstraint! /// stackView上部的间距
    @IBOutlet weak var stackViewBottomConst: NSLayoutConstraint! ///  stackView下部的间距
    @IBOutlet weak var stackViewLeftConst: NSLayoutConstraint! /// stackView左部的间距
    @IBOutlet weak var stackViewRightConst: NSLayoutConstraint! /// stackView右部的间距

    @IBOutlet weak var hudBgCenterY: NSLayoutConstraint! // 提示框背景居视图的竖直中间

    internal var customIcon: UIImage? = nil /// 自定义图片时候使用保存变量
    private var isShow = false
    weak private var parentView: UIView?
    private var status: Status = .normal
    private var message: String?

   private lazy var animation: CABasicAnimation = {
        let ani = CABasicAnimation(keyPath: "transform.rotation.z")
        ani.fromValue = 0.0
        ani.toValue = 2.0 * CGFloat.pi
        ani.duration = 1.0
        ani.repeatCount = MAXFLOAT
        ani.isRemovedOnCompletion = false
        return ani
    }()

    // 从bundle资源获取xib文件
    private class var bundle: Bundle {
        var bundle = Bundle.main
        if let resource = Bundle(for: FZHudView.classForCoder()).path(forResource: "FZToastKit", ofType: "bundle") {
            bundle = Bundle(path: resource) ?? Bundle.main
        }
        return bundle
    }

    internal class func toast(withView parent: UIView) -> FZHudView? {
        if let views = bundle.loadNibNamed("FZHudView", owner: nil, options: nil) as? [FZHudView], views.count > 0 {
            let view = views[0]
            view.backgroundColor = UIColor.black.withAlphaComponent(0)
            view.setup(withView: parent)
            return view
        }
        return nil
    }

    // 获取到视图做操作
    private func setup(withView view: UIView) {
        view.addSubview(self)
        parentView = view
        setupConstraint()
        isHidden = true
        hudBgView.layer.cornerRadius = FZToastManager.shared.config.cornerRadius
        hudBgView.clipsToBounds = true
    }

    // 设置父视图的约束
    private func setupConstraint() {
        guard let parent = parentView else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        let frameGuide = UILayoutGuide()
        parent.addLayoutGuide(frameGuide)

        let top = topAnchor.constraint(equalTo: frameGuide.topAnchor)
        let bottom = bottomAnchor.constraint(equalTo: frameGuide.bottomAnchor)
        let left = leftAnchor.constraint(equalTo: frameGuide.leftAnchor)
        let right = rightAnchor.constraint(equalTo: frameGuide.rightAnchor)
        let width = NSLayoutConstraint(item: parent, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: parent, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        parent.addConstraints([top, bottom, left, right, width, height])

        DispatchQueue.main.async {
            self.parentView?.layoutIfNeeded()
        }
    }

    // 更新显示状态
    private func updateStatusShow() {
        if iconImV.isAnimating {
            iconImV.stopAnimating()
            iconImV.animationImages = nil
        }
        messageLab.text = message
        bgView.backgroundColor = UIColor.black.withAlphaComponent(FZToastManager.shared.config.bgViewAlpha)
        hudBgCenterY.constant = FZToastManager.shared.config.offsetCenterY_hud
        stackViewTopConst.constant = FZToastManager.shared.config.paddingTop_hud
        stackViewBottomConst.constant = FZToastManager.shared.config.paddingBottom_hud
        stackViewLeftConst.constant = FZToastManager.shared.config.paddingLeft_hud
        stackViewRightConst.constant = FZToastManager.shared.config.paddingRight_hud
        messageLab.textColor = FZToastManager.shared.config.textColor
        messageLab.textAlignment = FZToastManager.shared.config.textAlignment_type
        messageLab.font = FZToastManager.shared.config.sizeFont_hud
        stackView.axis = FZToastManager.shared.config.verticalType == true ? .vertical : .horizontal

        switch status {
        case .normal:
            iconImV.isHidden = true
        case .loading:
            iconImV.isHidden = false
            iconImV.image = getImage(name: "Loading")
            stopAnimation()
            startAnimation()
        case .succeed:
            iconImV.isHidden = false
            iconImV.image = getImage(name: "Success")
        case .error:
            iconImV.isHidden = false
            iconImV.image = getImage(name: "Error")
        case .netWorkError:
            iconImV.isHidden = false
            iconImV.image = getImage(name: "Network_Error")
        case .custom:
            iconImV.isHidden = false
            iconImV.image = customIcon
        }

        layoutIfNeeded()
        showHUD()
    }

    private func startAnimation() {
        iconImV.layer.add(animation, forKey: "transform.rotation.z")
    }

    private func stopAnimation() {
        iconImV.layer.removeAllAnimations()
    }

    private func getImage(name: String) -> UIImage? {
        return UIImage(named: "FZToast_\(name).png", in: FZHudView.bundle, compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
    }

    // 临时存储父视图交互的交互状态
    private var isParentUserInteractionEnabled = true

    private func showHUD() {
        if isShow { return }
        isShow = true
        isHidden = false
        alpha = 0
        // 显示 hud 时禁用父视图交互
        isParentUserInteractionEnabled = parentView?.isUserInteractionEnabled ?? false
        parentView?.isUserInteractionEnabled = false
        parentView?.bringSubviewToFront(self)
        parentView?.layoutIfNeeded()
        layer.removeAllAnimations()

        UIView.animate(withDuration: 0.15) {
            guard self.isShow else { return }
            self.alpha = 1
        }
    }

    private func hideHUD() {
        if !isShow { return }
        isShow = false
        stopAnimation()
        layer.removeAllAnimations()
        self.parentView?.isUserInteractionEnabled = self.isParentUserInteractionEnabled

        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0
        }) { (finished) in
            guard !self.isShow else { return }
            self.isHidden = true
            self.reset()
        }
    }

    private func reset() {
        iconImV.image = nil
        customIcon = nil
        message = nil
        iconImV.animationImages = nil
        iconImV.stopAnimating()
    }

}

public extension UIView {
    private struct AssociatedKeys { static var FZHudViewKey = "FZHUD" }

    var DXHud: FZHudView {
        get {
            var hud = objc_getAssociatedObject(self, &AssociatedKeys.FZHudViewKey) as? FZHudView
            if hud == nil {
                hud = FZHudView.toast(withView: self)
                self.DXHud = hud!
            }
            return hud!
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.FZHudViewKey, newValue as FZHudView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public extension UIViewController {
    var DXHud: FZHudView {
        get { return view.DXHud }
        set { view.DXHud = newValue }
    }
}
