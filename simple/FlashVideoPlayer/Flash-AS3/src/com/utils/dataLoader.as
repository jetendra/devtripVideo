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
		private var _loader:URLLoader = new URLLoader();
		private var _request:URLRequest = new URLRequest();
		
		/**
		 * Constructor [Singelton]
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
			var file : String = (dataObj.url != undefined) ? dataObj.url : "data.xml" ;
			_fileExtension = file.split(".")[1];
			
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
		
		private function onLoaderComplete(e:Event):void
		{
			_loader.removeEventListener(Event.COMPLETE, onLoaderComplete);
			
			var _data : Object;
			
			switch(_fileExtension){
				case 'json':
					_data = JSON.decode(_loader.data);
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
		
		private function loadDataFile(file : String) : void {
			_request.url = file;
			_loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			_loader.load(_request);
		}
		
		private function loadFlashVars(dataObj : Object) : void {
			devtripVo.instance.params = dataObj;
			_dataLoadHandler_Callback();
		}
	}
}