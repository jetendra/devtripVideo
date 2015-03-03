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

package src.com.utils {
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import src.com.vo.devtripVo;
	import com.adobe.serialization.json.JSON;
	
	public class dataLoader {
		
		private var _instance : dataLoader;
		private var _dataLoadHandler_Callback : Function;
		private var _fileExtension : String;
		private var _loader:URLLoader;
		private var _request:URLRequest;
		
		/**
		 * Constructor: dataLoader [Singelton]
		 * @Constructor [Initializes the object.]
		 * */
		public function dataLoader(){
			if (_instance != null) throw Error('Singelton error');
			_instance = this;
		}
		
		/**
		 * @Public [access point for class]
		 * @param - [NA] 
		 * @return - [available instance of the class]
		 * */
		public function get instance() : dataLoader {
			if(_instance == null){
				_instance = new dataLoader();
			}
			return _instance;
		}
		
		/**
		 * @Public [initiate loading data assets]
		 * @param - [dataObj : Object , dataLoadHandler_Callback : Function] 
		 * @return - void
		 * */
		public function loadData( dataObj : Object , dataLoadHandler_Callback : Function ) : void {
			_dataLoadHandler_Callback = dataLoadHandler_Callback;
			var file : String = (dataObj.url != undefined) ? dataObj.url : null ;
			_fileExtension = (file) ? file.split(".")[1] : "";
			
			switch(_fileExtension){
				case 'json':
				case 'xml':
					loadDataFile(file);
					break;
				default :
					loadFlashVars(dataObj);
					break;
			}
		}
		
		/**
		 * @Private Load complete handler
		 * @param - [Event] 
		 * @return - [void]
		 * */
		private function onLoaderComplete(e:Event):void
		{
			_loader.removeEventListener(Event.COMPLETE, onLoaderComplete);
			
			var _data : Object;
			
			switch(_fileExtension){
				case 'json':
					_data = JSON.parse(_loader.data);
					break;
				case 'xml':
					_data = new XML(_loader.data) as Object;
					break;
			}
			
			devtripVo.instance.params = _data.params;
			devtripVo.instance.config = _data.config;
			devtripVo.instance.copyright = _data.copyright;
			
			_dataLoadHandler_Callback();
		}
		
		/**
		 * @Private initiate data file loading
		 * @param - [file url string] 
		 * @return - [void]
		 * */
		private function loadDataFile(file : String) : void {
			_loader = new URLLoader();
			_request = new URLRequest();
			_request.url = file;
			_loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			_loader.load(_request);
		}
		
		/**
		 * @Private popuated flash vars 
		 * @param - [Object] 
		 * @return - [void]
		 * */
		private function loadFlashVars(dataObj : Object) : void {
			var tparamsObj : Object = new Object();
			tparamsObj['width'] = (dataObj.DT_width != undefined) ? dataObj.DT_width : 640 ;
			tparamsObj['height'] = (dataObj.DT_height != undefined) ? dataObj.DT_height : 480;
			tparamsObj['video'] = (dataObj.DT_video != undefined) ? dataObj.DT_video : 'abc';
			tparamsObj['autoplay'] = (dataObj.DT_autoplay != undefined) ? dataObj.DT_autoplay : false;
			tparamsObj['videoImage'] = (dataObj.DT_videoImage != undefined) ? dataObj.DT_videoImage : 'abc.png';
			tparamsObj['assetsPath'] = (dataObj.DT_assetsPath != undefined) ? dataObj.DT_assetsPath : '';
			devtripVo.instance.params = tparamsObj;
			
			var tconfigObj : Object = new Object();
			//tbd
			devtripVo.instance.config = tconfigObj;
			
			var tcopyrightObj : Object = new Object();
			tcopyrightObj['info'] = '© 2015 devtrip video';
			tcopyrightObj['visitdata'] = 'visit DevTrip website';
			tcopyrightObj['visiturl'] = 'http://www.devtrip.com';
			devtripVo.instance.copyright = tcopyrightObj;
			
			_dataLoadHandler_Callback();
			
		}
	}
}