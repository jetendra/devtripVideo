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
	
	import src.com.utils.base.uiBase;
	import src.com.vo.devtripVo;
	import src.com.ui.videocontrols;
	
	public class videoplayer extends uiBase {
		
		private static var _instance : videoplayer = null;
		private var _videocontrols : videocontrols;
		
		/**
		 * Constructor [Singelton]
		 * */
		public function videoplayer() {
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
			init();
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		public static function get instance() : videoplayer {
			if(_instance == null){
				_instance = new videoplayer();
			}
			return _instance;
		}
		
		/**
		 * @Derived from base
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		override protected function initBaseProperties() : void {
			attachVideoControl();
		}
		
		override protected function loadHandler() : void {
			resizeElements();
			loadPoster();
			setVideo();
		}
		
		/**
		 * @private
		 * @param - [NA] 
		 * @return - [available instance of the class
		 * */
		private function attachVideoControl() : void {
			_videocontrols = videocontrols.instance;
			_videocontrols.y = devtripVo.instance.params.height;
			addElement(_videocontrols);
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function resizeElements():void{
			/*var _resizeFactor : Object = devtripVo.instance.resizeFactor;
			_ui.video._xscale =  _resizeFactor.widthRatio;
			_ui.video._yscale = _resizeFactor.heightRatio;
			_ui.videocontrols._xscale =  _resizeFactor.widthRatio;
			_ui.videocontrols._yscale =  _resizeFactor.heightRatio;
			_ui.poster._xscale =  _resizeFactor.widthRatio;
			_ui.poster._yscale =  _resizeFactor.heightRatio;*/
		}
		
		/**
		 * @Private 
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function loadPoster() : void {
			//this.poster.loadMovie( _data.assetsPath +"/"+_data.videoImage );
			//_ui.poster.loadedmovie = true;
			//addElement(_ui.poster);
		}
		
		/**
		 * @Public
		 * @param - [NA] 
		 * @return - [void]
		 * */
		public function hidePoster() : void {
			this.poster.visible = false;
		}
		
		/**
		 * @Private
		 * @param - [NA] 
		 * @return - [void]
		 * */
		private function setVideo():void {
			trace("here in setting video player");
		}
		
	}
}
