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

import src.com.utils.interfaces.buttonInterface;

class src.com.utils.base.buttonBase extends MovieClip implements buttonInterface {
	
	private var _elementArr : Array = [];
	
	public function buttonBase() {
		
	}
	
	function init() : Void {
		initBaseProperties();
		this.onLoad 			= function() { loadHandler() };
		this.onUnload 			= function() { unloadHandler() };
		this.onDragOut 			= function() { onDragOutHandler() };
		this.onDragOver 		= function() { onDragOverHandler() };
		this.onKeyDown 			= function() { onKeyDownHandler() };
		this.onKeyUp 			= function() { onKeyUpHandler() };
		this.onKillFocus 		= function(newFocus : Object) { onKillFocusHandler() };
		this.onMouseDown		= function() { onMouseDownHandler() };
		this.onMouseMove		= function() { onMouseMoveHandler() };
		this.onMouseUp			= function() { onMouseUpHandler() };
		this.onPress 			= function() { onPressHandler() };
		this.onRelease 			= function() { onReleaseHandler() };
		this.onReleaseOutside 	= function() { onReleaseOutsideHandler() };
		this.onRollOut 			= function() { onRollOutHandler() };
		this.onRollOver 		= function() { onRollOverHandler() };
		this.onSetFocus 		= function(oldFocus : Object) { onSetFocusHandler() };
	}
	
	function initBaseProperties() : Void {
		
	}
	
	function loadHandler() : Void {
		
	}
	
	function unloadHandler() : Void {
		removeElement();
	}
	
	function addElement(mc : MovieClip) : Void {
		_elementArr.push(mc);
	}
	
	function setState(str : String) : Void {
		this.gotoAndStop(str);
	}
	
	function onDragOutHandler() : Void {
		
	}
	
	function onDragOverHandler() : Void {
		
	}
	
	function onKeyDownHandler() : Void {
		
	}
	
	function onKeyUpHandler() : Void {
		
	}
	
	function onKillFocusHandler(newFocus : Object) : Void {
		
	}
	
	function onMouseDownHandler() : Void {
		
	}
	
	function onMouseMoveHandler() : Void {
		
	}
	
	function onMouseUpHandler() : Void {
		
	}
	
	function onPressHandler() : Void {
		setState('normal');
	}
	
	function onReleaseHandler() : Void {
		setState('normal');
	}
	
	function onReleaseOutsideHandler() : Void {
		setState('normal');
	}
	
	function onRollOutHandler() : Void {
		setState('normal');
	}
	
	function onRollOverHandler() : Void {
		setState('over');
	}
	
	function onSetFocusHandler(oldFocus : Object) : Void {
		
	}
	
	private function removeElement() : Void {
		for (var i in _elementArr){
			if(_elementArr[i].attached)
				_elementArr[i].removeMovieClip();
			else if(_elementArr[i].loadedmovie)
				_elementArr[i].unloadMovie();
		}
	}
}