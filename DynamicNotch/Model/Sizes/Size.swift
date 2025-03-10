//
//  Size.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/14/25.
//

import Foundation
import Defaults
import AppKit

//에어팟 연결할때
let connectAirpods: CGSize = .init(width: 65, height: 65)
let connectAirpodspromax: CGSize = .init(width: 85, height: 85)
let bluetoothEarphone: CGSize = .init(width: 65, height: 65)

//노치가 황성화될떄 사이즈 초기화
let onNotchSize: CGSize = .init(width: 610, height: 200)
//노치 활성화&비활성화 상태일 때 모서리 초기화
let cornerRadiusSet: (on: CGFloat, off: CGFloat) = (on: 24, off: 10)


enum MusicImageSize {
    static let cornerRadius: (on: CGFloat, off: CGFloat) = (on: 18.0, off: 3.0)
    static let size = (on: CGSize(width: 85, height: 85), off: CGSize(width: 25, height: 25))
}



func offNotchSize(screenName: String? = nil) -> CGSize {
    
    var width: CGFloat = 185
    var height: CGFloat = Defaults[.notchHeight]
    
    var targetScreen = NSScreen.main
    
    if let customScreen = screenName {
        targetScreen = NSScreen.screens.first(where: { $0.localizedName == customScreen})
    }
    
    if let screenName = targetScreen {
        
        //너비 구하는 것
        if let leftPadding: CGFloat = screenName.auxiliaryTopLeftArea?.width, let rightPadding: CGFloat = screenName.auxiliaryTopRightArea?.width {
            width = screenName.frame.width - leftPadding - rightPadding + 25
        }
        
        //높이 구하는 것
        //노치가 있는 경우
        if screenName.safeAreaInsets.top > 0 {
            height = Defaults[.notchHeight]
            
            if Defaults[.heightMode] == .realNotch {
                height = screenName.safeAreaInsets.top
            } else if Defaults[.heightMode] == .menubar{
                height = screenName.frame.maxY - screenName.visibleFrame.maxY
            }
        }else { //없는 경우
            height = Defaults[.nonNotchHeight]
            
            if Defaults[.nonNotchHeightMode] == .menubar {
                height = screenName.frame.maxY - screenName.visibleFrame.maxY
            }
        }
    }
    
    return .init(width: width, height: height)
}

