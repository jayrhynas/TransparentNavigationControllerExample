//
//  AutoMaskingLayer.swift
//  TransparentNavigationControllerExample
//
//  Created by Jayson Rhynas on 2020-06-26.
//  Copyright © 2020 Jayson Rhynas. All rights reserved.
//

import UIKit

/// A layer that is to be used as a mask.
/// When told to update, it will adjust it's own frame such that
/// it appears the `maskingLayer` is masking out the `maskingHost`
class AutoMaskingLayer: CALayer {
    @discardableResult
    class func mask(_ host: CALayer, with mask: CALayer) -> AutoMaskingLayer {
        let layer = AutoMaskingLayer()
        layer.maskingHost = host
        layer.maskingLayer = mask
        host.mask = layer
        return layer
    }
    
    override init() {
        super.init()
        
        self.backgroundColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = UIColor.black.cgColor
    }
    
    // the layer that this is set as a mask on
    weak var maskingHost: CALayer? {
        didSet {
            guard let host = self.maskingHost else {
                return
            }
            
            self.frame = host.bounds
        }
    }
    
    // the layer that should be masking out the host layer
    weak var maskingLayer: CALayer?
    
    func update() {
        guard let host = self.maskingHost?.presentation() ?? self.maskingHost else {
            return
        }
        
        var frame = host.bounds
        
        if let mask = self.maskingLayer?.presentation() ?? self.maskingLayer {
            let maskFrame = host.convert(mask.bounds, from: mask)
            frame.size.width = max(0, maskFrame.minX)
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        self.frame = frame
        
        CATransaction.commit()
    }
}
