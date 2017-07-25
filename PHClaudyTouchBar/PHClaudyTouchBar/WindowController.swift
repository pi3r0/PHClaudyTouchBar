//
//  WindowController.swift
//  PHClaudyTouchBar
//
//  Created by Pierre Houguet on 25/07/2017.
//  Copyright © 2017 Pierre Houguet. All rights reserved.
//

import Cocoa


class WindowController: NSWindowController, NSTouchBarDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        guard let viewController = contentViewController as? ViewController else {
            return nil
        }
        return viewController.makeTouchBar()
    }
    
//    func Claudy(sender: NSButton) {
//        let title = sender.title
//        
//        guard let sound = NSSound(named: title) else {
//            return
//        }
//        sound.play()
//    }
//    
//    @available(OSX 10.12.2, *)
//    override func makeTouchBar() -> NSTouchBar? {
//        let touchBar = NSTouchBar()
//        touchBar.delegate = self
//        touchBar.customizationIdentifier = .touchBar
//        
//        touchBar.defaultItemIdentifiers = [.connasse, .couilles, .stress, .flexibleSpace,.beer, .out, .alien, .flexibleSpace,.goodnight]
//        touchBar.customizationAllowedItemIdentifiers =  [.iam ,.connasse, .couilles, .stress,.shaved,.beer, .out, .missed, .alien, .goodnight]
//        
//        return touchBar
//    }
//    
//    
//    @available(OSX 10.12.2, *)
//    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
//        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
//        var title = "";
//        var label = "";
//        switch identifier {
//        case NSTouchBarItemIdentifier.iam:
//            title = "👦"
//            label = "Je suis claudy"
//            break;
//        case NSTouchBarItemIdentifier.goodnight:
//            title = "🌑"
//            label = "Terminer bonsoir"
//            break
//        case NSTouchBarItemIdentifier.out:
//            title = "⛔"
//            label = "Ou tu sors, ou j'te sors"
//            break
//        case NSTouchBarItemIdentifier.beer:
//            title = "🍺"
//            label = "J'aime bien la mousse"
//            break
//        case NSTouchBarItemIdentifier.connasse:
//            
//            title = "👸"
//            label = "Connasse"
//            break
//        case NSTouchBarItemIdentifier.couilles:
//            
//            title = "🏑"
//            label = "Pas commencer à jouer avec mes couilles"
//            
//            break
//        case NSTouchBarItemIdentifier.shaved:
//            title = "💇"
//            label = "Est ce que t'es epilée"
//            break
//        case NSTouchBarItemIdentifier.missed:
//            title = "🐴"
//            label = "Il t'ont pas loupé"
//            break
//        case NSTouchBarItemIdentifier.stress:
//            title = "😤"
//            label = "T'es tendue"
//            break
//        case NSTouchBarItemIdentifier.alien:
//            title = "👽"
//            label = "Alien"
//            break;
//        default:
//            title = ""
//            return nil;
//        }
//        
//        if title != "" {
//            let button = NSButton(title: title, target: self, action: #selector(Claudy))
//            touchBarItem.view = button
//            touchBarItem.customizationLabel = label;
//            return touchBarItem
//            
//        }
//        return nil;
//    }
//    


}
