//
//  VisionSupport.swift
//  Mini vMac
//
//  Created by Jesús A. Álvarez on 2024-02-09.
//  Copyright © 2024 namedfork. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension ViewController {
#if os(visionOS)
    @objc
    func initXr() {
        ViewController.adjustToScreenSize()
        ornaments = [
            UIHostingOrnament(sceneAnchor: .bottom, contentAlignment: .center) {
                VStack {
                    Spacer(minLength: 80.0)
                    HStack {
                        Button(action: {
                            AppDelegate.sharedInstance().showSettings(self)
                        }, label: {
                            Image(systemName: "gear")
                        }).glassBackgroundEffect()

                        Button(action: {
                            AppDelegate.sharedInstance().showInsertDisk(self)
                        }, label: {
                            Image(systemName: "opticaldiscdrive")
                        }).glassBackgroundEffect()

                        Button(action: {
                            self.showKeyboard(self)
                        }, label: {
                            Image(systemName: "keyboard")
                        }).glassBackgroundEffect()
                    }.padding(.all)
                        .glassBackgroundEffect()
                }
            }
        ]
    }

    @objc
    static func adjustToScreenSize() {
        let screenSize = AppDelegate.sharedEmulator().screenSize
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        let minSize = screenSize
        let defaultSize = screenSize.applying(.init(scaleX: 2.0, y: 2.0))
        let maxSize = screenSize.applying(.init(scaleX: 3.0, y: 3.0))
        windowScene.sizeRestrictions?.minimumSize = minSize
        windowScene.sizeRestrictions?.maximumSize = maxSize
        windowScene.requestGeometryUpdate(UIWindowScene.GeometryPreferences.Vision(
            size: defaultSize,
            minimumSize: minSize,
            maximumSize: maxSize,
            resizingRestrictions: .uniform
        ))
    }
#endif
}
