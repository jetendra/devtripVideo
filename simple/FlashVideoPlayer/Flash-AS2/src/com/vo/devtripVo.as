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


class src.com.vo.devtripVo {
	
	private static var _instance : devtripVo = null;
	private static var _params : Object = new Object();
	private static var _ui : MovieClip = null;
	private static var _resizeFactor : Number = 1;
	
	public function devtripVo() {
		if (_instance != null) throw Error('Singelton error');
		_instance = this;
	}
	
	public static function get instance() : devtripVo {
		if(_instance == null){
			_instance = new devtripVo();
		}
		return _instance;
	}
	
	public function set params(value : Object) : Void {
		_params = value;
		calculateResizeRatio();
	}
	
	public function get params() : Object {
		return _params;
	}
	
	public function set ui(value : MovieClip) : Void {
		_ui = value;
	}
	
	public function get ui() : MovieClip {
		return _ui;
	}
	
	public function get resizeFactor () : Number {
		return _resizeFactor;
	}
	
	private function calculateResizeRatio(): Void {
		var widthRatio : Number = Number(_params.width) / 640;
		var heightRatio : Number = Number(_params.height) / 480;
		if(widthRatio < heightRatio){
			_resizeFactor = widthRatio;
		} else if (widthRatio > heightRatio) {
			_resizeFactor = heightRatio;
		} else {
			_resizeFactor = widthRatio = heightRatio;
		}
	}
	
}