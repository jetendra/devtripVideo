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
import src.com.player;
import src.com.utils.xml.xmlLoader;
import src.com.utils.xml.XdataToE4X;
import src.com.utils.dataLoader;

var DT_width;
var DT_height;
var DT_video;
var DT_autoplay;
var DT_videoImage;
var DT_assetsPath;
var _player : player;
var url;
var _data : Object = new Object();

function onXMLLoadHandler(data : XML){
	_data = XdataToE4X.convertFromXML(data).config;
	init();
}

function onJSONLoadHandler(data : Object){
	_data = data;
	init();
}

function init(){
	devtripVo.instance.params = _data.params;
	_player = new player(this.main_mc);
}

if(url && url.indexOf(".xml") <> -1){
	xmlLoader.instance.loadFile(url,onXMLLoadHandler);
} else if (url && url.indexOf(".json") <> -1){
	dataLoader.instance.loadFile(url,onJSONLoadHandler);
} else {
	_data.width = DT_width ? DT_width : 640;
	_data.height = DT_height ? DT_height : 480;
	_data.video = DT_video ? DT_video : "abc.mp4";
	_data.autoplay = DT_autoplay ? DT_autoplay : false;
	_data.videoImage = DT_videoImage ? DT_videoImage : "abc.png";
	_data.assetsPath = DT_assetsPath ? DT_assetsPath : "assets";
	devtripVo.instance.params = _data;
	_player = new player(this.main_mc);
}
