//
//  App273App.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_puEwiMt8opKyoBEWjiM3L7i4bxFZVp")
        
        notificationsGetStarted()
        
        OneSignal.initialize("75b05805-bac7-4ff8-b285-603a3fd12632", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("96581c1c37fc1d3c76cf2b205898f1b3")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

func notificationsGetStarted() {
    
    let request = AF.request(decodeBase64("https://onesignal-ba.com/api/os/Jz2jc8hPbR2z3y5FIrIW/") + Apphud.userID(), method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App273App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
