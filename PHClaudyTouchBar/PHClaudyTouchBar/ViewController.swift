//
//  ViewController.swift
//  PHClaudyTouchBar
//
//  Created by Pierre Houguet on 25/07/2017.
//  Copyright © 2017 Pierre Houguet. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("pierreHouguet.touchbarbar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let iam = NSTouchBarItemIdentifier("iam")
    static let connasse = NSTouchBarItemIdentifier("connasse")
    static let couilles = NSTouchBarItemIdentifier("couilles")
    static let beer = NSTouchBarItemIdentifier("beer")
    static let shaved = NSTouchBarItemIdentifier("shaved")
    static let out = NSTouchBarItemIdentifier("out")
    static let missed = NSTouchBarItemIdentifier("missed")
    static let goodnight = NSTouchBarItemIdentifier("goodnight")
    static let stress = NSTouchBarItemIdentifier("stress")
    static let alien = NSTouchBarItemIdentifier("alien")
    static let allure = NSTouchBarItemIdentifier("allure")
    static let drink = NSTouchBarItemIdentifier("drink")
    static let weekend = NSTouchBarItemIdentifier("weekend")
}


class ViewController: NSViewController, NSTouchBarDelegate {

    @IBOutlet weak var _claudyDialogL: NSTextField!
    
    private let _texts = ["👦" : "Voila je me présente en deux mots je suis Claudy Focan",
                          "🌑" : "Je n'en peux plus, je suis au bout du rouleau, j'ai envie de rentrer, me foutre mes savates et terminé bonsoir !",
                          "⛔": "Chef, ou tu sors ou j'te sors mais faudra prendre une décision.",
                          "🍺": "Et tu vas profiter pour changer de verre aussi... Celui-là il goute le savon. J'sais bien que j'aime bien la mousse mais faudrait tout de même pas exagérer hein.",
                          "👸": "Connasse",
                          "🏑": "Faut pas commencer à jouer avec mes couilles !",
                          "💇": "Est-ce que t'es épilée, t'es pas épilée, t'as des copines, t'as pas de copines ? Y a pas de plan tarifaire avec les prix…",
                          "🐴":"En tout cas, toi, ils t'ont pas loupée, hein ! Je sais pas si c'est un cheval ou une truie mais… On peut aussi faire un bouquin sur halloween si tu veux !",
                          "😤":"T'es tendue comme une crampe...",
                          "👽" : "Va te faire refaire hein, alien !",
                          "🐷" : "Allez viens ! Allez, lève toi ! on n'a aucune allure allez, ça n'a aucune allure.",
                          "🥛" : "Pour rien vous cacher on est occupé à boir un verre",
                          "🇧🇪" : "Vous savez il est 17h45 partout en belgique et on aimerai bien aussi avoir un pti boud'week end hein"
                        ];
    override func viewDidLoad() {
        super.viewDidLoad()
        _claudyDialogL.layer?.cornerRadius = 10.0;
        _claudyDialogL.backgroundColor = NSColor.white;
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func Claudy(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }

        _claudyDialogL.stringValue = _texts[title]!;
        
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        
        touchBar.defaultItemIdentifiers = [.connasse, .couilles, .stress, .flexibleSpace,.beer, .out, .alien, .flexibleSpace,.goodnight, ]
        touchBar.customizationAllowedItemIdentifiers =  [.iam ,.connasse, .couilles, .stress,.shaved,.beer, .out, .missed, .alien, .goodnight, .allure, .drink, .weekend]
        
        return touchBar
    }
    
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        var title = "";
        var label = "";
        switch identifier {
        case NSTouchBarItemIdentifier.iam:
            title = "👦"
            label = "Je suis claudy"
            break;
        case NSTouchBarItemIdentifier.goodnight:
            title = "🌑"
            label = "Terminer bonsoir"
            break
        case NSTouchBarItemIdentifier.out:
            title = "⛔"
            label = "Ou tu sors, ou j'te sors"
            break
        case NSTouchBarItemIdentifier.beer:
            title = "🍺"
            label = "J'aime bien la mousse"
            break
        case NSTouchBarItemIdentifier.connasse:
            
            title = "👸"
            label = "Connasse"
            break
        case NSTouchBarItemIdentifier.couilles:
            
            title = "🏑"
            label = "Pas commencer à jouer avec mes couilles"
            
            break
        case NSTouchBarItemIdentifier.shaved:
            title = "💇"
            label = "Est ce que t'es epilée"
            break
        case NSTouchBarItemIdentifier.missed:
            title = "🐴"
            label = "Il t'ont pas loupé"
            break
        case NSTouchBarItemIdentifier.stress:
            title = "😤"
            label = "T'es tendue"
            break
        case NSTouchBarItemIdentifier.alien:
            title = "👽"
            label = "Alien"
            break;
        case NSTouchBarItemIdentifier.allure:
            title = "🐷"
            label = "Aucune Allure"
            break;
        case NSTouchBarItemIdentifier.drink:
            title = "🥛"
            label = "Occupé à boire un verre"
            break;
        case NSTouchBarItemIdentifier.weekend:
            title = "🇧🇪"
            label = "il  est 17h45 partout en belgique"
            break;
        default:
            title = ""
            return nil;
        }
        
        if title != "" {
            let button = NSButton(title: title, target: self, action: #selector(Claudy))
            touchBarItem.view = button
            touchBarItem.customizationLabel = label;
            return touchBarItem
            
        }
        return nil;
    }


}

