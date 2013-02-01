package com.xmlalibrary.interfaces
{
	public interface IXMLAExecuteBuilder extends IXMLABuilder
	{
		function setPropertiesPart(part:IXMLAPropertyPart):void;
		
		function setCommandPart(part:IXMLACommandPart):void;
		
		function addProperty(name:String, value:String):void;
		
		function addCommand(name:String, value:String):void;
	}
}