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
	private static var _config : Object = new Object();
	private static var _copyright : Object = new Object();
	private static var _ui : MovieClip = null;
	private static var _resizeFactor : Number = 1;
	private static var _infoObject : Object;
	private static var _isPlaying : Boolean;
	
	/**
	 * Constructor [Singelton]
	 * */
	public function devtripVo() {
		if (_instance != null) throw Error('Singelton error');
		_instance = this;
	}
	
	/**
	 * @Public [access point for class]
	 * @param - [NA] 
	 * @return - [available instance of the class
	 * */
	public static function get instance() : devtripVo {
		if(_instance == null){
			_instance = new devtripVo();
		}
		return _instance;
	}
	
	/**
	 * @Public
	 * @param - [Object] 
	 * @return - [NA]
	 * */
	public function set params(value : Object) : Void {
		_params = value;
		calculateResizeRatio();
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Object]
	 * */
	public function get params() : Object {
		return _params;
	}
	
	/**
	 * @Public
	 * @param - [Object] 
	 * @return - [NA]
	 * */
	public function set config(value : Object) : Void {
		_config = value;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Object]
	 * */
	public function get config() : Object {
		return _config;
	}
	
	/**
	 * @Public
	 * @param - [Object] 
	 * @return - [NA]
	 * */
	public function set copyright(value : Object) : Void {
		_copyright = value;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Object]
	 * */
	public function get copyright() : Object {
		return _copyright;
	}
	
	/**
	 * @Public
	 * @param - [MovieClip] 
	 * @return - [NA]
	 * */
	public function set ui(value : MovieClip) : Void {
		_ui = value;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [MovieClip]
	 * */
	public function get ui() : MovieClip {
		return _ui;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Number]
	 * */
	public function get resizeFactor () : Number {
		return _resizeFactor;
	}
	
	/**
	 * @Private 
	 * @param - [NA] 
	 * @return - [NA]
	 * */
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
	
	/**
	 * @Public
	 * @param - [Object] 
	 * @return - [NA]
	 * */
	public function set infoObject(obj : Object) : Void {
		_infoObject = new Object();
		_infoObject = obj;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Object]
	 * */
	public function get infoObject() : Object {
		return _infoObject;
	}
	
	/**
	 * @Public
	 * @param - [Boolean] 
	 * @return - [NA]
	 * */
	public function set isPlaying(value : Boolean) : Void {
		_isPlaying = value;
	}
	
	/**
	 * @Public
	 * @param - [NA] 
	 * @return - [Boolean]
	 * */
	public function get isPlaying() : Boolean {
		return _isPlaying;
	}
	
}