//
//  BUDNativeViewController.swift
//  BUADVADemo_Swift
//
//  Created by bytedance on 2020/11/6.
//

import Foundation

class BUDRewardVideoAdViewController: ViewController {
    private var _rewardedVideoAd:BURewardedVideoAd?;
    private lazy var _statusLabel = UILabel();
    
    override func viewDidLoad() {
        self.navigationItem.title = "Reward"
        self.view.backgroundColor = .white;
        creatView()
    }
    ///load Portrait Ad
    @objc func loadPortraitAd(_ sender:UIButton) -> Void {
        loadRewardVideoAdWithSlotID(slotID: "980088192")
    }
    ///load Landscape Ad
    @objc func loadLandscapeAd(_ sender:UIButton) -> Void {
        loadRewardVideoAdWithSlotID(slotID: "980099801")
    }
    ///show ad
    @objc func showAd(_ sender:UIButton) -> Void {
        _rewardedVideoAd?.show(fromRootViewController: self)
        
        _statusLabel.text = "Tap left button to load Ad";
    }
    func loadRewardVideoAdWithSlotID(slotID:String) -> Void {
        // important: Every time the data is requested, a new one BURewardedVideoAd needs to be initialized. Duplicate request data by the same full screen video ad is not allowed.
        let rewardModel = BURewardedVideoModel()
        _rewardedVideoAd = BURewardedVideoAd.init(slotID: slotID, rewardedVideoModel: rewardModel)
        _rewardedVideoAd?.delegate = self
        _rewardedVideoAd?.loadData()
        
        _statusLabel.text = "Loading......";
    }
}
///BURewardedVideoAdDelegate
extension BUDRewardVideoAdViewController: BURewardedVideoAdDelegate {
    /**
     This method is called when video ad material loaded successfully.
     */
    func rewardedVideoAdDidLoad(_ rewardedVideoAd: BURewardedVideoAd) {
        _statusLabel.text = "Ad loaded";
    }

    /**
     This method is called when video ad materia failed to load.
     @param error : the reason of error
     */
    func rewardedVideoAd(_ rewardedVideoAd: BURewardedVideoAd, didFailWithError error: Error?) {
        _statusLabel.text = "Ad loaded fail";
    }

    /**
     This method is called when cached successfully.
     */
    func rewardedVideoAdVideoDidLoad(_ rewardedVideoAd: BURewardedVideoAd) {
        _statusLabel.text = "Video caching complete";
    }

    /**
     This method is called when video ad slot will be showing.
     */
    func rewardedVideoAdWillVisible(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }

    /**
     This method is called when video ad slot has been shown.
     */
    func rewardedVideoAdDidVisible(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }

    /**
     This method is called when video ad is about to close.
     */
    func rewardedVideoAdWillClose(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }

    /**
     This method is called when video ad is closed.
     */
    func rewardedVideoAdDidClose(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }

    /**
     This method is called when video ad is clicked.
     */
    func rewardedVideoAdDidClick(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }


    /**
     This method is called when video ad play completed or an error occurred.
     @param error : the reason of error
     */
    func rewardedVideoAdDidPlayFinish(_ rewardedVideoAd: BURewardedVideoAd, didFailWithError error: Error?) {
        
    }

    /**
     Server verification which is requested asynchronously is succeeded.
     @param verify :return YES when return value is 2000.
     */
    func rewardedVideoAdServerRewardDidSucceed(_ rewardedVideoAd: BURewardedVideoAd, verify: Bool) {
        
    }

    /**
      Server verification which is requested asynchronously is failed.
      @param rewardedVideoAd rewarded Video ad
      @param error request error info
     */
    func rewardedVideoAdServerRewardDidFail(_ rewardedVideoAd: BURewardedVideoAd, error: Error) {
        
    }
    
    /**
     This method is called when the user clicked skip button.
     */
    func rewardedVideoAdDidClickSkip(_ rewardedVideoAd: BURewardedVideoAd) {
        
    }

    /**
     this method is used to get type of rewarded video Ad
     */
    func rewardedVideoAdCallback(_ rewardedVideoAd: BURewardedVideoAd, with rewardedVideoAdType: BURewardedVideoAdType) {
        
    }
}
///Exmple UI
extension BUDRewardVideoAdViewController {
    func creatView() -> Void {
        let color = UIColor.init(red: 1.0, green: 0, blue: 23.0/255.0, alpha: 1);
        
        let safeTop = Double(self.navigationController?.view.safeAreaInsets.top ?? 0.0)
        _statusLabel.font = UIFont.init(name: "PingFang-SC", size: 16)
        _statusLabel.textColor = color
        _statusLabel.textAlignment = .center
        _statusLabel.translatesAutoresizingMaskIntoConstraints = false
        _statusLabel.text = "Tap left button to load Ad"
        self.view.addSubview(_statusLabel);
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[_statusLabel]-20-|", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["_statusLabel":_statusLabel]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[_statusLabel(25)]", options: NSLayoutConstraint.FormatOptions.init(), metrics: ["top":NSNumber.init(value:safeTop+100.0)], views: ["_statusLabel":_statusLabel]))
        
        let loadPortraitAd = UIButton(type:.custom)
        loadPortraitAd.layer.borderWidth = 0.5;
        loadPortraitAd.layer.cornerRadius = 8;
        loadPortraitAd.layer.borderColor = UIColor.lightGray.cgColor
        loadPortraitAd.translatesAutoresizingMaskIntoConstraints = false
        loadPortraitAd.addTarget(self, action: #selector(self.loadPortraitAd), for: .touchUpInside)
        loadPortraitAd.setTitle("LoadPortraitAd", for: .normal)
        loadPortraitAd.setTitleColor(color, for: .normal)
        self.view.addSubview(loadPortraitAd)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[loadPortraitAd]-170-|", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["loadPortraitAd":loadPortraitAd]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[_statusLabel]-20-[loadPortraitAd(40)]", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["_statusLabel":_statusLabel,"loadPortraitAd":loadPortraitAd]))
        
        let loadLandscapeAd = UIButton(type:.custom)
        loadLandscapeAd.layer.borderWidth = 0.5;
        loadLandscapeAd.layer.cornerRadius = 8;
        loadLandscapeAd.layer.borderColor = UIColor.lightGray.cgColor
        loadLandscapeAd.translatesAutoresizingMaskIntoConstraints = false
        loadLandscapeAd.addTarget(self, action: #selector(self.loadLandscapeAd), for: .touchUpInside)
        loadLandscapeAd.setTitle("loadLandscapeAd", for: .normal)
        loadLandscapeAd.setTitleColor(color, for: .normal)
        self.view.addSubview(loadLandscapeAd)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[loadLandscapeAd]-170-|", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["loadLandscapeAd":loadLandscapeAd]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[loadPortraitAd]-20-[loadLandscapeAd(40)]", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["loadLandscapeAd":loadLandscapeAd,"loadPortraitAd":loadPortraitAd]))

        let showAd = UIButton(type:.custom)
        showAd.layer.cornerRadius = 8;
        showAd.translatesAutoresizingMaskIntoConstraints = false;
        showAd.addTarget(self, action: #selector(self.showAd), for: .touchUpInside)
        showAd.setTitle("showAd", for: .normal)
        showAd.setTitleColor(.white, for: .normal)
        showAd.setTitleColor(.blue, for: .highlighted)
        showAd.backgroundColor = color;
        self.view.addSubview(showAd);
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[showAd(80)]-40-|", options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: ["showAd":showAd]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[showAd(80)]", options: NSLayoutConstraint.FormatOptions.init(), metrics: ["top":NSNumber.init(value: safeTop+155.0)], views: ["showAd":showAd]))
    }
}
