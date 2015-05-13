//
//  RangeSlider.swift
//  RevivalxSwiftSlider
//
//  Created by Mohammad Nurdin bin Norazan on 5/12/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import UIKit

class RangeSlider: UIControl {

    var minimumValue: Float = 0.0
    var maximumValue: Float = 1.0
    var minimumRange: Float = 0.0
    var selectedMinimumValue: Float = 0.2
    var selectedMaximumValue: Float = 0.8
    
    var distanceFromCenter: Float = 0.0
    
    var _padding: Float = 20
    
    var _maxThumbOn: Bool = false
    var _minThumbOn: Bool = false
    
    var _minThumb = UIImageView()
    var _maxThumb = UIImageView()
    var _track = UIImageView()
    var _trackBackground = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        _minThumbOn = false;
        _maxThumbOn = false;
        _padding = 20;
        
        let _trackBackground = UIImageView(image: UIImage(named: "bar-background.png"))
        _trackBackground.center = self.center;
        self.addSubview(_trackBackground)
        
        let _track = UIImageView(image: UIImage(named: "bar-highlight.png"))
        _track.center = self.center
        self.addSubview(_track)
        
        
        let _minThumb = UIImageView(image: UIImage(named: "handle.png"), highlightedImage: UIImage(named: "handle-hover.png"))
        _minThumb.frame = CGRectMake(0,0, self.frame.size.height,self.frame.size.height);
        _minThumb.contentMode = UIViewContentMode.Center
        self.addSubview(_minThumb)
        
        let _maxThumb = UIImageView(image: UIImage(named: "handle.png"), highlightedImage: UIImage(named: "handle-hover.png"))
        _maxThumb.frame = CGRectMake(0,0, self.frame.size.height,self.frame.size.height)
        _maxThumb.contentMode = UIViewContentMode.Center
        self.addSubview(_maxThumb)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        
        _minThumb.center = CGPointMake(CGFloat(self.xForValue(selectedMinimumValue)), self.center.y);
        
        _maxThumb.center = CGPointMake(CGFloat(self.xForValue(selectedMaximumValue)), self.center.y)
        
        NSLog("Tapable size %f", _minThumb.bounds.size.width);
        self.updateTrackHighlight()

    }
    
    func xForValue(value: Float) -> Float {
        return (Float(self.frame.size.width) - (_padding * 2)) * ((value - minimumValue) / (maximumValue - minimumValue)) + _padding
    }
    
    func valueForX(x: Float) -> Float {
        return minimumValue + (x - _padding) / (Float(self.frame.size.width) - (_padding * 2)) * (maximumValue - minimumValue)
    }
    
    func continueTrackingWithTouch(touch: UITouch, event: UIEvent) -> Bool {
        if !_minThumbOn && !_maxThumbOn {
            return true
        }
    
        var touchPoint: CGPoint = touch.locationInView(self)
        
        
        if _minThumbOn {
            _minThumb.center = CGPointMake(max(CGFloat(self.xForValue(minimumValue)),min(touchPoint.x - CGFloat(distanceFromCenter), CGFloat(self.xForValue(selectedMaximumValue - minimumRange)))),CGFloat(_minThumb.center.y))
            selectedMinimumValue = Float(self.valueForX(_minThumb.center.x))
        }
    
        if _maxThumbOn {
            _maxThumb.center = CGPointMake(min(CGFloat(self.xForValue(maximumValue)), max(touchPoint.x - CGFloat(distanceFromCenter), CGFloat(self.xForValue(selectedMinimumValue + minimumRange)))), CGFloat(_maxThumb.center.y))
            selectedMaximumValue = self.valueForX(_maxThumb.center.x)
        }
        
        self.updateTrackHighlight()
        self.setNeedsLayout()
    
        self.sendActionsForControlEvents(UIControlEvents.ValueChanged)
        return true
    }
    
    func beginTrackingWithTouch(touch: UITouch, event: UIEvent) -> Bool {
        var touchPoint: CGPoint = touch.locationInView(self)
        
        if(CGRectContainsPoint(_minThumb.frame, touchPoint)){
            _minThumbOn = true;
            distanceFromCenter = Float(touchPoint.x - _minThumb.center.x)
        }
        else if(CGRectContainsPoint(_maxThumb.frame, touchPoint)){
            _maxThumbOn = true;
            distanceFromCenter = Float(touchPoint.x - _maxThumb.center.x)
            
        }
        return true;

        
    }
    
    func endTrackingWithTouch(touch: UITouch, event: UIEvent) {
        _minThumbOn = false;
        _maxThumbOn = false;
    }
    
    func updateTrackHighlight() {
        _track.frame = CGRectMake(
        _minThumb.center.x,
        _track.center.y - (_track.frame.size.height/2),
        _maxThumb.center.x - _minThumb.center.x,
        _track.frame.size.height
        );
    }


}
