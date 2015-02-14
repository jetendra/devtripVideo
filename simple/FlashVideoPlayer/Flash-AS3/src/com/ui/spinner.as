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

package src.com.ui{
	
	import src.com.utils.base.uiBase;

	public class spinner extends uiBase {
		
		private static var _instance : spinner = null;
		private var ele : MovieClip;
		private	var frame : Number;
		private var segments : Number = 12;
		
		/**
		 * Constructor [Singelton]
		 * */
		public function spinner() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		public static function get instance() : spinner {
			if(_instance == null){
				_instance = new spinner();
			}
			return _instance;
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function initBaseProperties() : void {
			
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [Void]
		 * */
		override protected function loadHandler() : void {
			pauseSpinner();
			resizeElements();
		}
		
		/**
		 * @Public 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function playSpinner() : void {
			this.visible = true;
			for(var i : Number = 1;i <= segments; i++) {
				ele = this["ele" + i];
				frame = int((i - 1) / (segments - 1) * 14) + 1;
				ele.gotoAndPlay(ele.totalFrames - frame);
			}
		}
		
		/**
		 * @Public 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function pauseSpinner() : void {
			this.visible = false;
			for(var i : Number = 1;i <= segments; i++) {
				ele = this["ele" + i];
				ele.stop();
			}
		}
		
		/**
		 * @Private [Derived from base class]
		 * @param - [NA] 
		 * @return - [void]
		 * */
		override protected function unloadHandler() : void {
			
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
