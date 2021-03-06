//
//  slideInTransition.swift
//  UTSocial
//
//  Created by Maksat Zhazbayev on 4/11/19.
//  Copyright © 2019 Maksat Zhazbayev. All rights reserved.
//

import UIKit

class slideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
   
    var menuShowing = false

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
        
        let containerView = transitionContext.containerView
        let finalWidth = toVC!.view.bounds.width * 0.8
        let finalHeight = toVC!.view.bounds.height
        
        if menuShowing {
            //add main VC to container
            containerView.addSubview(toVC!.view)
            // init frame of screen
            toVC?.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        // animate onto screen
        let transfrom = {
            toVC?.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        //animate back off screen
        let identity = { fromVC?.view.transform = .identity}
        //animation of transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {self.menuShowing ? transfrom(): identity()}) { (_) in transitionContext.completeTransition(!isCancelled)}
        
    }
}
