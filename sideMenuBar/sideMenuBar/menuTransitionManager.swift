//
//  menuTransitionManager.swift
//  sideMenuBar
//
//  Created by Imcrinox Mac on 17/12/1444 AH.
//

import Foundation
import UIKit

@objc protocol menuTransitionManagerDelegate {
    func dismiss()
}

class menuTransitionManager : NSObject {
    
    var duration = 0.5
    var isPresenting = false
    var delegate : menuTransitionManagerDelegate?
    var snapshot : UIView?{
        didSet {
            if let _delegate = delegate {
                let tapGestureRecognizer = UITapGestureRecognizer(target: _delegate, action: #selector(menuTransitionManagerDelegate.dismiss))
                snapshot?.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }
}


extension menuTransitionManager : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let container = transitionContext.containerView
        let moveLeft = CGAffineTransform(translationX: 250, y: 0)
        let moveRight = CGAffineTransform(translationX: 0, y: 0)
        
        if isPresenting {
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView)
            container.addSubview(snapshot!)
        }
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut,animations: {
            if self.isPresenting {
                self.snapshot?.transform = moveLeft
                toView.transform = .identity
            }
            else {
                self.snapshot?.transform = .identity
                fromView.transform = moveRight
            }
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        })
    }
    
    
}

extension menuTransitionManager : UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting  = false
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
}
