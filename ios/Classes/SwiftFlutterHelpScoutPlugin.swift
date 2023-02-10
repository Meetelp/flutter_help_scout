import Flutter
import UIKit
import Beacon



public class SwiftFlutterHelpScoutPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kelvinforteta.dev/flutter_help_scout", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterHelpScoutPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    
    if(call.method.elementsEqual("initialize")){

        // initialize beacon
        initializeBeacon(arguments: arguments!)

        result("Beacon successfully initialized")
    }
    else if(call.method.elementsEqual("openBeacon")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeacon(beaconId: beaconId!)
      
        result("Beacon open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconSearch")){
     
        let beaconId = arguments!["beaconId"] as? String
        let query = arguments!["query"] as? String
        
        // open beacon
        openBeaconSearch(beaconId: beaconId!, query: query!)
      
        result("Beacon search open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconArticle")){
     
        let beaconId = arguments!["beaconId"] as? String
        let articleId = arguments!["articleId"] as? String
        
        // open beacon
        openBeaconArticle(beaconId: beaconId!, articleId: articleId!)
      
        result("Beacon article open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconContactForm")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeaconContactForm(beaconId: beaconId!)
      
        result("Beacon contact form open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconPreviousMessages")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeaconPreviousMessages(beaconId: beaconId!)
      
        result("Beacon previous messages open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconChat")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeaconChat(beaconId: beaconId!)
      
        result("Beacon chat open successfully!")
    }
    else if(call.method.elementsEqual("openBeaconAsk")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeaconAsk(beaconId: beaconId!)
      
        result("Beacon ask open successfully!")
    }

    else if(call.method.elementsEqual("logoutBeacon")){
     
        // logout beacon
        logoutBeacon()
      
        result("Beacon logged out successfully!")
    }

    else if(call.method.elementsEqual("clearBeacon")){
     
        // reset beacon
        resetBeacon()
      
        result("Beacon reset successfully!")
    }

    else if(call.method.elementsEqual("setCustomerProperty")){
     
        let key = arguments!["key"] as? String

        let value = arguments!["value"] as? String

        setCustomerProperty(key: key!, value: value!)
      
        result("Customer propery successfully set!")
    }

    else if(call.method.elementsEqual("removeCustomerProperty")){
     
        let key = arguments!["key"] as? String

        removeCustomerProperty(key: key!)
      
        result("Customer propery removed successfully!")
    }

    else if(call.method.elementsEqual("clearCustomerProperties")){
     
        clearCustomerProperties()
      
        result("Customer properties cleared successfully!")
    }
  }
    
    
  public func initializeBeacon(arguments: NSDictionary){
        
    let email = arguments["email"] as? String
    let name = arguments["name"] as? String
    let company = arguments["company"] as? String
    let jobTitle = arguments["jobTitle"] as? String
    let avatar = arguments["avatar"] as? URL
        
    let user = HSBeaconUser()
    user.email = email
    user.name = name
    user.company = company
    user.jobTitle = jobTitle
    user.avatar = avatar

    HSBeacon.identify(user)
 }

  // open the beacon
  public func openBeacon(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.open(settings)
  }

  // open the beacon search
  public func openBeaconSearch(beaconId: String, query: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate(BeaconRoute.search(query), settings: settings)
  }

  // open the beacon article
  public func openBeaconArticle(beaconId: String, articleId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate(BeaconRoute.article(articleId), settings: settings)
  }

  // open the beacon previous messages
  public func openBeaconPreviousMessages(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate(BeaconRoute.previousMessages, settings: settings)
  }

  // open the beacon contact form
  public func openBeaconContactForm(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate("/ask/message/", beaconSettings: settings)
  }

  // open the beacon chat
  public func openBeaconChat(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate(BeaconRoute.askChat, settings: settings)
  }

  // open the beacon ask
  public func openBeaconAsk(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.navigate(BeaconRoute.ask, settings: settings)
  }



  // logout beacon
  public func logoutBeacon(){
    HSBeacon.logout()
  }

  // reset beacon
  public func resetBeacon(){
    HSBeacon.reset()
  }

  public func setCustomerProperty(key: String, value: String){
    let user = HSBeaconUser()
    user.addAttribute(withKey: key, value: value)
  }

  public func removeCustomerProperty(key: String){
    let user = HSBeaconUser()
    user.removeAttribute(withKey: key)
  }

  public func clearCustomerProperties(){
    let user = HSBeaconUser()
    user.clearAttributes()
  }
    
}
