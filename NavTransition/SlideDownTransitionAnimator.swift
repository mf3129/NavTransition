//
//  SlideDownTransitionAnimator.swift
//  NavTransition
//
//  Created by Makan fofana on 5/8/19.
//  Copyright © 2019 MakanFofana. All rights reserved.
//

import Foundation
import UIKit

class SlideDownTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    
    // MARK: Delegate Protocols
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    
    // MARK: Animated Transitioning Protocols
    
    let duration = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //Obtaining reference to fromView, toView and contextView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        
        //Setting Up The Transform used for animation
        let container = transitionContext.containerView
        
        let offScreenUp = CGAffineTransform(translationX: 0, y: -container.frame.height)
        
        let offScreenDown = CGAffineTransform(translationX: 0, y: container.frame.height)
        
        //Making the toView offScreen
        toView.transform = offScreenUp
        
        //Adding both views to the container view
        container.addSubview(fromView)
        container.addSubview(toView)
        
        //Perform the Animation
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
            
             fromView.transform = offScreenDown
             fromView.alpha = 0.5
             toView.transform = CGAffineTransform.identity
             toView.alpha = 1.0
            
            
        }, completion: { finished in
            transitionContext.completeTransition(trues)
        })
        
        
        
    }
    
}


