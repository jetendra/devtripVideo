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

package src.com.ui{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.display.Stage;

	public class progressSlider extends MovieClip {
		
		private static var _instance : progressSlider = null;
		
		public var seekSlider : MovieClip;
		
		/**
		 * Constructor [Singelton]
		 * */
		public function progressSlider() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			initBaseProperties();//init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		public static function get instance() : progressSlider {
			if(_instance == null){
				_instance = new progressSlider();
			}
			return _instance;
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function initBaseProperties() : void {
			addEvent();
		}
		
		private function addEvent() : void {
			seekSlider.buttonMode = true;
			seekSliderArea.buttonMode = true;
			seekSlider.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			seekSlider.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			seekSlider.addEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
			seekSliderArea.addEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		private function removeEvent() : void {
			seekSlider.removeEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			seekSlider.removeEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			seekSlider.removeEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
			seekSliderArea.removeEventListener(MouseEvent.CLICK, MouseClickHandler);
		}
		
		private function MouseDownHandler(evt : MouseEvent) : void {
			var rect:Rectangle = new Rectangle(0,0,this.seekSliderArea.width - seekSlider.width,0);
			seekSlider.startDrag(false , rect);
			stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
		}
		
		private function MouseUpHandler(evt : MouseEvent) : void {
			seekSlider.stopDrag();
		}
		
		private function stageMouseUpHandler(evt : MouseEvent) : void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			seekSlider.stopDrag();
		}
		
		private function MouseMoveHandler(evt : MouseEvent) : void {
			evt.updateAfterEvent();
		}
		
		private function MouseClickHandler(evt : MouseEvent) : void {
			seekSlider.x = seekSliderArea.mouseX;
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
