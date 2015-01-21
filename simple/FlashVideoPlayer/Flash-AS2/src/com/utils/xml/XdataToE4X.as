class src.com.utils.xml.XdataToE4X {
	
	private static var obj : Object = null;
	public static function convertFromXML(xmlObject : XML) : Object {
		obj = addXChildren(xmlObject);
		delete xmlObject.idMap;
		xmlObject.idMap = null;
		delete xmlObject;
		xmlObject = null;
		return obj;
	}

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