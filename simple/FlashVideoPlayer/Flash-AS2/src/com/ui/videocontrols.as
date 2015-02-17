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

import src.com.utils.base.uiBase;
import src.com.vo.devtripVo;
import src.com.ui.speakerButton;
import src.com.ui.videoplayer;

class src.com.ui.videocontrols extends uiBase {
	
	private static var _instance : videocontrols = null;
	private static var _data : Object;
	private static var _ui : MovieClip;
	private var progressSlider : MovieClip;
	private var speakerSlider : MovieClip;
	private var spinner : MovieClip;
	private var isDragging : Boolean = false;
	
	/**
	 * Constructor [Singelton]
	 * */
	public function videocontrols() {
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
		_ui = devtripVo.instance.ui.videoplayer;
		_data = devtripVo.instance.params;
	}
	
	/**
	 * @Private [Derived from base class]
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function loadHandler() : Void {
		super.loadHandler();
		addSeekSlider();
		addVolumeSlider();
		resizeElements();
	}
	
	/**
	 * @Private 
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function addSeekSlider() : Void {
		this.progressSlider.seekSliderArea.onPress = function(){
			var a : MovieClip = this._parent.seekSlider;
			var b : Number = this._parent.seekSliderArea._width;
			var c : Number = this._parent.seekSlider._width;
			a._x = this._xmouse;
			videoplayer.setSteramTime( a._x / (b - c) * 100 );
		};
		this.progressSlider.seekSlider.onPress = function(){
			_instance.isDragging = true;
			startDrag(this,true, 0, 0 , this._parent._width - this._width, 0 );
			
		};
		this.progressSlider.seekSlider.onRelease = this.progressSlider.seekSlider.onReleaseOutside = function(){
			_instance.isDragging = false;
			var a : MovieClip = this;
			var b : Number = this._parent.seekSliderArea._width;
			var c : Number = this._width;
			a.stopDrag();
			videoplayer.setSteramTime( a._x / (b - c) * 100 );
			
		};
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	public function setSeek(l : Number) : Void {
		if(_instance.isDragging)return;
		var a : MovieClip = this.progressSlider.seekSlider;
		var b : Number = this.progressSlider.seekSliderArea._width;
		a._x = (b - a._width) * l / 100;
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function addVolumeSlider() : Void {
		this.speakerSlider.sliderArea.onPress = function(){
			var a : MovieClip = this._parent.slider;
			var b : Number = this._parent.slider._width;
			a._x = this._xmouse;
			videoplayer.setVolume(Math.floor((a._x + b) / b * 100));
		};
		this.speakerSlider.slider.onPress = function(){
			startDrag(this,true, 0, 0 , -1 * this._width, 0 );
		};
		this.speakerSlider.slider.onRelease = this.speakerSlider.slider.onReleaseOutside = function(){
			var a : MovieClip = this;
			var b : Number = this._width;
			a.stopDrag();
			videoplayer.setVolume(Math.floor((a._x + b) / b * 100));
		};
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	public function setPlaySpinner() : Void {
		this.spinner.playSpinner();
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	public function setPauseSpinner() : Void {
		this.spinner.pauseSpinner();
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function unloadHandler() : Void {
		super.unloadHandler();
	}
	
	/**
	 * @Private
	 * @param - [NA] 
	 * @return - [Void]
	 * */
	private function resizeElements():Void{
		
	}
}
