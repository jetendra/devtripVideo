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

class src.com.utils.xml.XdataToE4X {
	
	private static var obj : Object = null;
	
	/**
	 * @public
	 * @param - [XML - Xml onject] 
	 * @return - [Object]
	 * */
	public static function convertFromXML(xmlObject : XML) : Object {
		obj = addXChildren(xmlObject);
		delete xmlObject.idMap;
		xmlObject.idMap = null;
		delete xmlObject;
		xmlObject = null;
		return obj;
	}
	
	/**
	 * @private
	 * @param - [XMLNode - xmlNode] 
	 * @return - [Object]
	 * */
	private static function addXChildren(xmlNode : XMLNode) : Object {
		var objNode:Object;
		if (xmlNode.childNodes[0].nodeType == 3){
			objNode = new Object();
			objNode = xmlNode.childNodes[0].nodeValue;
			for (var i in xmlNode.attributes){
				if (objNode.attr == undefined){
					objNode.attr = new Object();
				}
				objNode.attr[i] = xmlNode.attributes[i];
			}
			delete i;
			i = null;
		}else if (xmlNode.childNodes.length == 0){
			objNode = new Object();
			for (var i in xmlNode.attributes){
				if (objNode.attr == undefined){
					objNode.attr = new Object();
				}
			objNode.attr[i] = xmlNode.attributes[i];
			}
			delete i;
			i = null;
		}else{
			objNode = new Object();
			for (var i = 0; i < xmlNode.childNodes.length; ++i){
				var child = xmlNode.childNodes[i];
				var name = child.nodeName;
				if (objNode[name] == undefined){
					objNode[name] = addXChildren(child);
					continue;
				}
				if (!(objNode[name] instanceof Array)){
					objNode[name] = new Array(objNode[name]);
				}
				objNode[name].push(addXChildren(child));
			}
			delete i;
			i = null;
			for (var i in xmlNode.attributes){
				if (objNode.attr == undefined){
					objNode.attr = new Object();
				}
			objNode.attr[i] = xmlNode.attributes[i];
			}
			delete i;
			i = null;
		}
		delete xmlNode;
		xmlNode = null;
		return (objNode);
	}
}