﻿/**
*
Copyright (c) 2014-15 Kavindra Dubey - kavindra.dubey@gmail.com [personal site - devtrip.com]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name(s) of the above copyright holders shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization.

The end-user documentation included with the redistribution, if any, must include the following acknowledgment: "This product includes software developed by The DevtripVideo Project, (http://www.devtrip.com/) and its contributors", in the same place and form as other third-party acknowledgments. Alternately, this acknowledgment may appear in the software itself, in the same form and location as other such third-party acknowledgments.
*
**/

import src.com.utils.base.buttonBase;
import src.com.ui.videoplayer;
import src.com.vo.devtripVo;

class src.com.ui.playButton extends buttonBase {
	
	private static var _instance : playButton = null;
	
	/**
	 * Constructor [Singelton]
	 * */
	public function playButton() {
		if (_instance != null) throw Error('Singelton error');
		_instance = this;
		init();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function initBaseProperties() : Void {
		super.initBaseProperties();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function loadHandler() : Void {
		super.loadHandler();
		resizeElements();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function unloadHandler() : Void {
		super.unloadHandler();
	}
	
	/**
	 * @Private [resize elements handler]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function resizeElements():Void{
		
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function onPressHandler() : Void {
		super.onPressHandler();
		videoplayer.instance.hidePoster();
		
		if(this._currentframe == 1)
			setState("pause");
		else
			setState("play");
		
		if(devtripVo.instance.isPlaying)
			videoplayer.instance.pauseVideo();
		else
			videoplayer.instance.playVideo();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function onReleaseHandler() : Void {
		super.onReleaseHandler();
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function onReleaseOutsideHandler() : Void {
		super.onReleaseOutsideHandler();
	}
}