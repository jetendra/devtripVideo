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

package src.com.ui {

	import src.com.utils.base.buttonBase;
	import src.com.ui.videoplayer;
	import src.com.vo.devtripVo;
	import flash.events.MouseEvent;
	
	public class playButton extends buttonBase {
		
		private static var _instance : playButton = null;
		
		/**
		 * Constructor : progressSlider
		 * @Constructor Initializes the object.
		 * */ 
		public function playButton() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		public static function get instance() : playButton {
			if(_instance == null){
				_instance = new playButton();
			}
			return _instance;
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [MouseEvent] 
		 * @return - [void]
		 * */
		override protected function MouseClickHandler(evt : MouseEvent) : void {
			videoplayer.instance.hidePoster();
			
			if(this.currentFrame == 1)
				setState("pause");
			else
				setState("play");
			
			if(devtripVo.instance.isPlaying)
				videoplayer.instance.pauseVideo(this.currentLabel);
			else
				videoplayer.instance.playVideo();
		}
				
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function loadHandler() : void {
			this.buttonMode = true;
			resizeElements();
		}
		
		/**
		 * @Private resize elements
		 * @param - [NA] 
		 * @return - [Void]
		 * */
		private function resizeElements():void{
			
		}
	}
}
