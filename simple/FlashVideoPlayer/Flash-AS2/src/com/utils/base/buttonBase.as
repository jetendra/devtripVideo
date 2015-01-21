/**
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
	
	/**
	 * Constructor
	 * */
	public function buttonBase() {
		
	}
	
	/**
	 * @init() definition
	 * @param - [AN] 
	 * @return - [NA]
	 * */
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
	
	/**
	 * @initBaseProperties() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function initBaseProperties() : Void {
		
	}
	
	/**
	 * @loadHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function loadHandler() : Void {
		
	}
	
	/**
	 * @unloadHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function unloadHandler() : Void {
		removeElement();
	}
	
	/**
	 * @addElement() definition
	 * @param - [MovieClip] 
	 * @return - [NA]
	 * */
	function addElement(mc : MovieClip) : Void {
		_elementArr.push(mc);
	}
	
	/**
	 * @setState() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function setState(str : String) : Void {
		this.gotoAndStop(str);
	}
	
	/**
	 * @onDragOutHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onDragOutHandler() : Void {
		
	}
	
	/**
	 * @onDragOverHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onDragOverHandler() : Void {
		
	}
	
	/**
	 * @onKeyDownHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onKeyDownHandler() : Void {
		
	}
	
	/**
	 * @onKeyUpHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onKeyUpHandler() : Void {
		
	}
	
	/**
	 * @onKillFocusHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onKillFocusHandler(newFocus : Object) : Void {
		
	}
	
	/**
	 * @onMouseDownHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onMouseDownHandler() : Void {
		
	}
	
	/**
	 * @onMouseMoveHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onMouseMoveHandler() : Void {
		
	}
	
	/**
	 * @onMouseUpHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onMouseUpHandler() : Void {
		
	}
	
	/**
	 * @onPressHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onPressHandler() : Void {
		setState('normal');
	}
	
	/**
	 * @onReleaseHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onReleaseHandler() : Void {
		setState('normal');
	}
	
	/**
	 * @onReleaseOutsideHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onReleaseOutsideHandler() : Void {
		setState('normal');
	}
	
	/**
	 * @onRollOutHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onRollOutHandler() : Void {
		setState('normal');
	}
	
	/**
	 * @onRollOverHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onRollOverHandler() : Void {
		setState('over');
	}
	
	/**
	 * @onSetFocusHandler() definition
	 * @param - [NA] 
	 * @return - [NA]
	 * */
	function onSetFocusHandler(oldFocus : Object) : Void {
		
	}
	
	/**
	 * @Private 
	 * @param - [NA] 
	 * @return - [NA]
	 * Removed loaded / attached movie clip from the referenced symbol.
	 * */
	private function removeElement() : Void {
		for (var i in _elementArr){
			if(_elementArr[i].attached)
				_elementArr[i].removeMovieClip();
			else if(_elementArr[i].loadedmovie)
				_elementArr[i].unloadMovie();
		}
	}
}