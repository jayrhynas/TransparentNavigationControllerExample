//
//  NavigationController.swift
//  TransparentNavigationControllerExample
//
//  Created by Jayson Rhynas on 2020-06-26.
//  Copyright © 2020 Jayson Rhynas. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    static let enableMasking = true
    static let transitionSpeed: Float = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        delegate = self
    }

    private var transitionOperation: UINavigationController.Operation = .none
    private var transitionMasks: [AutoMaskingLayer] = []
    private weak var transitionTimer: Timer?

    // 1. when transition starts, we save the type of operation and set up the mask the bottom view with the top view
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard Self.enableMasking else {
            return nil
        }
        
        self.transitionOperation = operation

        let bottomVC = operation == .push ? fromVC : toVC
        let topVC    = operation == .push ? toVC   : fromVC

        self.applyMask(to: bottomVC.view.layer, with: topVC.view.layer)

        return nil
    }
        
    #warning("If masking is necessary, how can I reliably obtain and mask the _UIParallaxDimmingView that is inserted between the two view controllers")
    private func findDimmingView(in container: UIView) -> UIView? {
        container.subviews.first(where: { $0.backgroundColor != nil })
    }
    
    // 2. by the start of the animation, the dimming view exists, so we mask it as well
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // slow down transition for debugging
        navigationController.view.layer.speed = Self.transitionSpeed
        
        guard Self.enableMasking else {
            return
        }
        
        guard let coordinator = self.transitionCoordinator,
              self.transitionOperation != .none,
              let topView = coordinator.view(forKey: self.transitionOperation == .push ? .to : .from)
        else {
            return
        }
        
        coordinator.animate(alongsideTransition: { context in
            guard let dimmingView = self.findDimmingView(in: context.containerView) else {
                return
            }

            UIView.performWithoutAnimation {
                self.applyMask(to: dimmingView.layer, with: topView.layer)
            }
        }, completion: nil)
    }
    
    // 3. after everything is finished, we remove the masks and stop the timer
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navigationController.view.layer.speed = 1.0

        guard Self.enableMasking else {
            return
        }
        
        self.transitionTimer?.invalidate()

        self.transitionMasks.forEach { $0.maskingHost?.mask = nil }
        self.transitionMasks.removeAll()
    }
    
    // we apply a mask and tell it to update very frequently to stay (rougly) in sync with the animation
    private func applyMask(to bottomLayer: CALayer, with topLayer: CALayer) {
        let mask = AutoMaskingLayer.mask(bottomLayer, with: topLayer)
        
        self.transitionMasks.append(mask)
        
        if self.transitionTimer == nil {
            #warning("If masking is necessary, what is the best way to update the mask frame during the animation, other than a timer?")
            let timer = Timer(timeInterval: 0.00001, repeats: true) { [weak self] _ in
                self?.transitionMasks.forEach { $0.update() }
            }
            self.transitionTimer = timer
            
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}
