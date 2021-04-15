//
//  colorExtension.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/14/21.
//
import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double)-> Color{
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    static let backgroundColor = Color.rgb(r:56,g:100,b:47)
    static let outlineColor = Color.rgb(r:43,g:255,b:79)
    static let trackColor = Color.rgb(r:45,g:81,b:40)
    static let pulsatingColor = Color.rgb(r:169,g:244,b:167)
    
}
