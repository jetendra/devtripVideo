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
	 * @des - API will load provided xml or type and and laded result data will be
	 * 			given back by it's callback function
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
	
	private function errorEventHandler(fileRef : String) : Void {
		trace("invalid XML '" + fileRef + "'");
	}
	
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
