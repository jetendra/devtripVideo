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
import src.com.utils.json.jsonLoader;

class src.com.utils.dataLoader{
	
	private static var _instance : dataLoader;
	private static var jL : jsonLoader;
	private static var obj : Object;
	
	/**
	 * privides a single refernce of this class 
	 * 
	 * */
	public static function get instance() : dataLoader {
		if(_instance == null){
			_instance = new dataLoader();
		}
		return _instance;
	}
	
	/**
	 * @public [load data file]
	 * @param - [String - file name url, Function - callback loaded event/function] 
	 * @return - [Void]
	 * */
	public function loadFile(fileRef : String, dataLoaded : Function):Void {
		if (jL) {
			delete jL;
			jL = null;
		}
		jL = new jsonLoader();
		jL.onData = function (src:String) {
			if(src != undefined){
				dataLoaded(getJsonObject(src));
			} else {
				jL.onLoad(false);
			}
		}
		jL.onLoad = function(success : Boolean) {
			if (success) {
				trace("data loaded");
			}else {
				_instance.errorEventHandler(fileRef);
			}
		}
		jL.load(fileRef);
	}
	
	/**
	 * @private [provide the JSON object]
	 * @param - [String - data source] 
	 * @return - [Object]
	 * */
	private function getJsonObject(src : String) : Object {
		return jL.getJsonObject(src);
	}
	
	/**
	 * @private [error event for data load handler]
	 * @param - [String - file reference] 
	 * @return - [Void]
	 * */
	private function errorEventHandler(fileRef : String) : Void {
		trace("invalid XML '" + fileRef + "'");
	}
	
	
}