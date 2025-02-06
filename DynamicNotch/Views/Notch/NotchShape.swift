//
//  NotchShape.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/4/25.
//
import SwiftUI

struct NotchShape: Shape {
    
    var topCornerRadius: CGFloat = 20
    
    var bottomCornerRadius: CGFloat = 15
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in  //
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // Top left inner curve
            path.addQuadCurve(
                to: CGPoint(x: rect.minX + topCornerRadius, y: rect.minY + topCornerRadius),
                control: CGPoint(x: rect.minX + topCornerRadius, y: rect.minY)
            )
            
            // Left vertical line
            path.addLine(to: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY - bottomCornerRadius))
            
            // Bottom left corner
            path.addQuadCurve(
                to: CGPoint(x: rect.minX + topCornerRadius + bottomCornerRadius, y: rect.maxY),
                control: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY)
            )
            
            // Bottom horizontal line
            path.addLine(to: CGPoint(x: rect.maxX - topCornerRadius - bottomCornerRadius, y: rect.maxY))
            
            // Bottom right corner
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY - bottomCornerRadius),
                control: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY)
            )
            
            // Right vertical line
            path.addLine(to: CGPoint(x: rect.maxX - topCornerRadius, y: rect.minY + topCornerRadius))
            
            // Top right inner curve
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.minY),
                control: CGPoint(x: rect.maxX - topCornerRadius, y: rect.minY)
            )
            
            // Closing the path
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}



#Preview {
    NotchShape()
        .frame(width: 200, height: 32)
        .background(Color.blue)
        .padding(100)
}
