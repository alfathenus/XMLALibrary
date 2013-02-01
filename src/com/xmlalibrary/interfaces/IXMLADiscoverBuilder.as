package com.xmlalibrary.interfaces
{
	public interface IXMLADiscoverBuilder extends IXMLABuilder
	{
		/**
		 * TODO: documentar
		 */
		function get type():String;
		function set type(value:String):void;
		
		/**
		 * TODO: documentar
		 */
		function setDiscoverTypePart(part:IXMLADiscoverTypePart):void;
		
		/**
		 * TODO: documentar
		 */
		function setRestrictionPart(part:IXMLARestrictionsPart):void;
		
		/**
		 * TODO: documentar
		 */
		function setPropertiesPart(part:IXMLAPropertyPart):void;
		
		/**
		 * TODO: documentar
		 */
		function addRestriction(name:String, value:String):void;
		
		/**
		 * TODO: documentar
		 */
		function addProperty(name:String, value:String):void;
	}
}