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

package src.com.ui {
	
	import src.com.utils.base.uiBase;
	import src.com.vo.devtripVo;
	import src.com.ui.spinner;
	import src.com.ui.playButton;
	import src.com.ui.fullscreenButton;
	import src.com.ui.progressSlider;
	import src.com.ui.speakerButton;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.display.Stage;
	
	public class videocontrols extends uiBase {
		
		private static var _instance : videocontrols = null;
		private static var _data : Object;
		public var _spinner : spinner;
		public var _playBtn : playButton;
		public var _fullscreenBtn : fullscreenButton;
		public var _progressSlider : progressSlider;
		public var _speakerButton : speakerButton;
		public var _speakerSlider : MovieClip;
		
		/**
		 * Constructor [Singelton]
		 * */
		public function videocontrols() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		public static function get instance() : videocontrols {
			if(_instance == null){
				_instance = new videocontrols();
			}
			return _instance;
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function loadHandler() : void {
			addVolumeSlider();
			resizeElements();
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function addVolumeSlider() : void {
			addEvent();
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function addEvent() : void {
			this._speakerSlider.slider.buttonMode = true;
			this._speakerSlider.slider.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this._speakerSlider.slider.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this._speakerSlider.slider.addEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
			this._speakerSlider.slider.addEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function removeEvent() : void {
			this._speakerSlider.slider.removeEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this._speakerSlider.slider.removeEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this._speakerSlider.slider.removeEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
			this._speakerSlider.slider.removeEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		/**
		 * @Private 
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		private function MouseDownHandler(evt : MouseEvent) : void {
			var rect:Rectangle = new Rectangle(0,0,-1 * this._speakerSlider.slider.width,0);
			this._speakerSlider.slider.startDrag(false , rect);
			stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
		}
		
		/**
		 * @Private 
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		private function MouseUpHandler(evt : MouseEvent) : void {
			this._speakerSlider.slider.stopDrag();
		}
		
		/**
		 * @Private 
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		private function stageMouseUpHandler(evt : MouseEvent) : void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			this._speakerSlider.slider.stopDrag();
		}
		
		/**
		 * @Private 
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		private function MouseMoveHandler(evt : MouseEvent) : void {
			evt.updateAfterEvent();
		}
		
		/**
		 * @Private 
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		private function MouseClickHandler(evt : MouseEvent) : void {
			
		}
		
		/**
		 * @Public
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function setPlaySpinner() : void {
			this._spinner.playSpinner();
		}
		
		/**
		 * @Public
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function setPauseSpinner() : void {
			this._spinner.pauseSpinner();
		}
		
		/**
		 * @Private
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function resizeElements():void{
			
		}
	}
}