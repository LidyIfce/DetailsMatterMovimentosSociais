//
//  ZoomTransitioningDelegate.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 28/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
@objc
protocol ZoomingViewController {
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView?
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView?
}

enum TransitionState {
    case initial
    case final
}

class ZoomTransitioningDelegate: NSObject {
    var transitioningDuration = 0.4
    var operation: UINavigationController.Operation = .none
    private let zoomScale = CGFloat(0.2)
    private let backgroundScale = CGFloat(0.7)

    typealias ZoomingViews = (otherView: UIView, imageView: UIView)
    
    //swiftlint:disable function_parameter_count
    func configureViews(for state: TransitionState,
                        containerView: UIView,
                        backgroundViewController: UIViewController,
                        viewsInBackGround: ZoomingViews,
                        viewsInForeground: ZoomingViews,
                        snapshotViews: ZoomingViews) {
        switch state {
        case .initial:
           
            backgroundViewController.view.transform = CGAffineTransform.identity
            backgroundViewController.view.alpha = 1
            
            snapshotViews.imageView.frame = containerView.convert(viewsInBackGround.imageView.frame,
                                                                  from: viewsInBackGround.imageView.superview)

        case .final:
            backgroundViewController.beginAppearanceTransition(false, animated: true)
            backgroundViewController.view.transform = CGAffineTransform(scaleX: backgroundScale, y: backgroundScale)
            backgroundViewController.view.alpha = 0
            
            snapshotViews.imageView.frame = containerView.convert(viewsInForeground.imageView.frame,
                                                                  from: viewsInForeground.imageView.superview)
        }
    }
}

extension ZoomTransitioningDelegate: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitioningDuration
    }

    //swiftlint:disable function_body_length
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewControoler = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        
        var backgroundViewController = fromViewController
        var foregroundViewController = toViewControoler
        
        if operation == .pop {
            backgroundViewController = toViewControoler
            foregroundViewController = fromViewController
        }
        
        let maybeBackgroundImageView = (backgroundViewController as? ZoomingViewController)?.zoomingImageView(for: self)
        let maybeForegroundImageView = (foregroundViewController as? ZoomingViewController)?.zoomingImageView(for: self)
        
        assert(maybeBackgroundImageView != nil, "Cannot find imageView in backgroundVC")
        assert(maybeForegroundImageView != nil, "Cannot find imageView in foregroundVC")
        
        let backgroundImageView = maybeBackgroundImageView!
        let foregroundImageView = maybeForegroundImageView!
    
        let imageViewSnapshot = UIImageView(image: backgroundImageView.image)
        imageViewSnapshot.contentMode = .scaleAspectFit
        imageViewSnapshot.layer.masksToBounds = true
        
        let foregroundViewBackgroundColor = foregroundViewController.view.backgroundColor
        foregroundViewController.view.backgroundColor = .clear
        containerView.backgroundColor = .white
        
        let alphaView = UIView(frame: transitionContext.finalFrame(for: toViewControoler))
        alphaView.backgroundColor = foregroundViewBackgroundColor
        
        containerView.addSubview(backgroundViewController.view)
        containerView.addSubview(foregroundViewController.view)
        containerView.addSubview(alphaView)
        containerView.addSubview(imageViewSnapshot)
     
        var preTransitionState = TransitionState.initial
        var postTransitionState = TransitionState.final
        
        if operation == .pop {
            preTransitionState = .final
            postTransitionState = .initial
        }
        //swiftlint:disable multiple_closures_with_trailing_closure
        configureViews(for: preTransitionState,
                       containerView: containerView,
                       backgroundViewController: backgroundViewController,
                       viewsInBackGround: (backgroundImageView, backgroundImageView),
                       viewsInForeground: (foregroundImageView, foregroundImageView),
                       snapshotViews: (imageViewSnapshot, imageViewSnapshot))
        
        foregroundViewController.view.layoutIfNeeded()
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        
                        backgroundImageView.isHidden = true
                        foregroundImageView.isHidden = true
                        alphaView.alpha = 0.9
                        
                        fromViewController.view.isHidden = true
                      
            self.configureViews(for: postTransitionState,
                                containerView: containerView,
                                backgroundViewController: backgroundViewController,
                                viewsInBackGround: (backgroundImageView, backgroundImageView),
                                viewsInForeground: (foregroundImageView, foregroundImageView),
                                snapshotViews: (imageViewSnapshot, imageViewSnapshot))
            
        }) { _ in
            alphaView.alpha = 0
            backgroundViewController.view.transform = CGAffineTransform.identity
            imageViewSnapshot.removeFromSuperview()
            alphaView.removeFromSuperview()
            backgroundImageView.isHidden = false
            foregroundImageView.isHidden = false
          
            fromViewController.view.isHidden = false
        
            foregroundViewController.view.backgroundColor = foregroundViewBackgroundColor
            
            transitionContext.completeTransition((!transitionContext.transitionWasCancelled))
        }
        
    }
    
}

extension ZoomTransitioningDelegate: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC is ZoomingViewController && toVC is ZoomingViewController {
            self.operation = operation
            return self
        } else { return nil }
    }
}
