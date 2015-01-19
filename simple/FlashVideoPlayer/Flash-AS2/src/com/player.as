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

import src.com.vo.devtripVo;
import src.com.utils.base.uiBase;

class src.com.player extends uiBase {
	
	private static var _instance : player = null;
	private static var _ui : MovieClip = null;
	private static var video : Video;
	private static var _data : Object;
	private static var _conVideo : NetConnection = null;
	private static var _netStrm : NetStream = null;
	
	public function player(ui:MovieClip) {
		devtripVo.instance.ui = ui;
		init();
	}
	
	private function initBaseProperties() : Void {
		super.initBaseProperties();
		/*if(devtripVo.instance.params == null){
			_data = new Object();
			_data.width = 640;
			_data.height = 480;
			_data.video = "abc.mp4";
			_data.autoplay = false;
			_data.videoImage = "abc.png";
			_data.assetsPath = "assets";
			devtripVo.instance.params = _data;
		}*/
		devtripVo.instance.ui.attachMovie("videoplayer","videoplayer",1);
		devtripVo.instance.ui.attached = true;
		addElement(devtripVo.instance.ui);
	}
	
	private function loadHandler() : Void {
		super.loadHandler();
	}
	
	private function unloadHandler() : Void {
		super.unloadHandler();
	}
}