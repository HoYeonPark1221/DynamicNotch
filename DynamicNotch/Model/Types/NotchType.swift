//
//  NotchType.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/13/25.
//

import Foundation
import Defaults

//notch 기본형태 정의
public enum NotchStyle {
    case notch, iNotch  //m자 노치모양 , i자 노치모양
}


//노치안에 표시될 주요 화면 종류
public enum NotchMainFeaturesView {
    case home
    case tray
}


//노치의 상태
public enum NotchStatus {
    case off
    case on
}


enum MusicSliderColor: String, Defaults.Serializable {
    case basic = "white"
    case albumColor = "match albumColor"
}


enum notchHeightSize: String, Defaults.Serializable {
    case menubar = "menubar Height" //구형 맥북 사용자는 노치 높이를 메뉴바 높이와 동일하게
    case realNotch = "realNotch Height"
    case custom = "Custom Notch Height"
}
