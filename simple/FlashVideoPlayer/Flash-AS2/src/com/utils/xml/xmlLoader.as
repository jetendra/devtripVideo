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

class src.com.utils.xml.xmlLoader{
	
	private static var _instance : xmlLoader = null;
	private static var _request : XML = null;
	
	/**
	 * privides a single refernce of this class 
	 * 
	 * */
	 
	public static function get instance() : xmlLoader {
		if(_instance == null){
			_instance = new xmlLoader();
		}
		return _instance;
	}
	
	/**
	 * @public
	 * @param - [String - file name url, Function - callback loaded event/function] 
	 * @return - [Nothing]
	 * */
	 
	public function loadFile(fileRef : String, dataLoaded : Function):Void {
		if (_request) {
			delete _request.idMap;
			_request.idMap = null;
			delete _request;
			_request = null;
		}
		_request = new XML();
		_request.ignoreWhite = true;
		_request.onLoad = function(success : Boolean) {
			if (success) {
				trace(_request)
				dataLoaded(_request);
			}else {
				_instance.errorEventHandler(fileRef);
			}
		}
		_request.load(fileRef);
	}
	
	/**
	 * @private
	 * @param - [String - fileRef in string] 
	 * @return - [Void]
	 * */
	private function errorEventHandler(fileRef : String) : Void {
		trace("invalid XML '" + fileRef + "'");
	}
	
	/**
	 * @public
	 * @param - [String - file name url, Function - callback loaded event/function] 
	 * @return - [Void]
	 * */
	public function loadTxtFile(tFileRef : String, tDataLoaded : Function, tDataFailed : Function) : Void {
		var txtRequest : LoadVars = new LoadVars();
		txtRequest.onLoad = function(success : Boolean) {
			if (success) {
				tDataLoaded(this);
				delete txtRequest;
				txtRequest = null;
			}else {
				_instance.errorEventHandler(tFileRef);
				tDataFailed();
			}
		}
		txtRequest.load(tFileRef);
	}
}
