//
//  RangeSlider.swift
//  RevivalxSwiftSlider
//
//  Created by Mohammad Nurdin bin Norazan on 5/12/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import UIKit

class RangeSlider: UIControl {

    var minimumValue = 0.0
    var maximumValue = 1.0
    var minimumRange = 0.0
    var selectedMinimumValue = 0.2
    var selectedMaximumValue = 0.8
    
    var distanceFromCenter = 0.0
    
    var _padding = 20
    
    var _maxThumbOn = false
    var _minThumbOn = false
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        _minThumbOn = false;
        _maxThumbOn = false;
        _padding = 20;
        
        let _trackBackground = UIImageView(image: UIImage(named: "bar-background.png"))
        _trackBackground.center = self.center;
       // _trackBackground.frame = CGRectMake((frame.size.width - _trackBackground.frame.size.width) / 2, (frame.size.height - _trackBackground.frame.size.height) / 2, _trackBackground.frame.size.width, _trackBackground.frame.size.height)
        self.addSubview(_trackBackground)
        
        let _track = UIImageView(image: UIImage(named: "bar-highlight.png"))
        _track.center = self.center
        //_track.frame = CGRectMake((frame.size.width - _track.frame.size.width) / 2, (frame.size.height - _track.frame.size.height) / 2, _track.frame.size.width, _track.frame.size.height)
        self.addSubview(_track)
        
        
        let _minThumb = UIImageView(image: UIImage(named: "handle.png"), highlightedImage: UIImage(named: "handle-hover.png"))
        _minThumb.frame = CGRectMake(0,0, self.frame.size.height,self.frame.size.height);
        //_minThumb.center = CGPointMake(self.xForValue.selectedMinimumValue,  self.frame.size.height / 2)
        //UIViewContentModeCenter
        _minThumb.contentMode = UIViewContentMode.Center
        self.addSubview(_minThumb)
        
        let _maxThumb = UIImageView(image: UIImage(named: "handle.png"), highlightedImage: UIImage(named: "handle-hover.png"))
        _maxThumb.frame = CGRectMake(0,0, self.frame.size.height,self.frame.size.height)
        //_maxThumb.center = CGPointMake(self.xForValue.selectedMaximumValue,  self.frame.size.height / 2)
        //UIViewContentModeCenter
        _maxThumb.contentMode = UIViewContentMode.Center
        self.addSubview(_maxThumb)
    }
    
    override func layoutSubviews() {
        /*
        _minThumb.center = CGPointMake(self.xForValue.selectedMinimumValue, self.center.y);
        
        _maxThumb.center = CGPointMake(self.xForValue.selectedMaximumValue, self.center.y);
        
        
        NSLog("Tapable size %f", _minThumb.bounds.size.width);
        self.updateTrackHighlight
*/
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
