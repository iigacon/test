//
//  ViewController.swift
//  testcallsdk
//
//  Created by Tien Doan on 7/26/21.
//

import UIKit
import MetechCallSdk

class ViewController: UIViewController {
    
    var callManager = MetechCall()
    var userName = "111"
    var password = "123456@A"
    var domain = "42.112.25.68:5082"
    
    @objc func onRegistedStateChanged(_ notification: Notification)
    {
        let loginStateRaw = notification.userInfo?["LoginState"] as? Int ?? 0
        print(loginStateRaw)
        switch loginStateRaw {
            case LoginState.Progress.rawValue:
                // trạng thái đang đăng nhập
                break
            case LoginState.Ok.rawValue:
                // trạng thái đang đăng nhập thành công
//                callManager.makeCall(destination: "0898572528", call_id: "4b1375e5-cb47-4b9d-bad7-903129e1f880", user_id: "111")
                break
            case LoginState.Failed.rawValue:
            // trạng thái đang đăng nhập thất bại
                break
            default:
                break
        }
    }
    
    @objc func onCallStateChanged(_ notification: Notification)
    {
        let callStateRaw = notification.userInfo?["CallState"] as? Int ?? 0
        print(callStateRaw)
        switch callStateRaw {
            case CallState.IncomingReceived.rawValue:
                //có cuộc gọi đến
                break
            case CallState.OutgoingInit.rawValue:
                //bắt đầu gọi ra
                break
            case CallState.OutgoingProgress.rawValue:
                //đang gọi ra
                break
            case CallState.OutgoingRinging.rawValue:
                //đang đổ chuông
                break
            case CallState.Connected.rawValue:
//                callManager.endCall()
                //đã kết nối
                break
            case CallState.End.rawValue:
                //Kết thúc cuộc gọi
                break
            //... Xem thêm trong call state enum
            default:
                break
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // đăng nhập với tên/mật khẩu và domain được cấp
        callManager.register(username: userName, password: password, domain: domain)
        // gọi đến một số
//        callManager.makeCall(destination: "0898572528", "", "")
        // dập máy
//        callManager.endCall()
        // chấp nhận cuộc gọi đến
//        callManager.acceptCall()
        // từ chối một cuộc gọi đến
//        callManager.declineCall()
        // mute mic
//        callManager.mute()
        // unmute mic
//        callManager.unmute()
        // turn on speaker (bật loa ngoài)
//        callManager.speakerOn()
        // turn off speaker (dùng loa trong)
//        callManager.speakerOff()
//        callManager.logout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRegistedStateChanged(_:)), name: .registrationState, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onCallStateChanged(_:)), name: .callState, object: nil)
        // Do any additional setup after loading the view.
        
    }

}

