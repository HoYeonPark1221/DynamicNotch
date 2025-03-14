//
//  NotchShape.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/4/25.
//
import SwiftUI

struct NotchShape: Shape {
    
    var topCorner: CGFloat = 5
    var bottomCorner: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY)) //(0,0)
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) //(200, 0)
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX - topCorner, y: rect.minY + topCorner), control: CGPoint(x: rect.maxX - topCorner, y: rect.minY)) //(195, 5) & 제어점 (195,0)
            //
            path.addLine(to: CGPoint(x: rect.maxX - topCorner, y: rect.maxY - bottomCorner)) //(195, 22)
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX - topCorner - bottomCorner , y: rect.maxY), control: CGPoint(x: rect.maxX - topCorner, y: rect.maxY)) // (185, 32)
            
            
            //하단 평행선
            path.addLine(to: CGPoint(x: rect.minX + topCorner + bottomCorner, y: rect.maxY)) //(15, 32)
            
            path.addQuadCurve(to: CGPoint(x: rect.minX + topCorner, y: rect.maxY - bottomCorner), control: CGPoint(x: rect.minX + topCorner, y: rect.maxY)) //(5, 22)
            
            path.addLine(to: CGPoint(x: rect.minX + topCorner, y: rect.minY + topCorner))
            
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY), control: CGPoint(x: rect.minX + topCorner, y: rect.minY))
            
        }
    }
}



#Preview {
    NotchShape()
        .frame(width: 200, height: 32)
        .padding(.all, 100)
}
