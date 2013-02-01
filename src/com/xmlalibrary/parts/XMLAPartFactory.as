package com.xmlalibrary.parts
{
	import com.xmlalibrary.interfaces.IXMLACommandPart;
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.interfaces.IXMLADiscoverTypePart;
	import com.xmlalibrary.interfaces.IXMLAPart;
	import com.xmlalibrary.interfaces.IXMLAPropertyPart;
	import com.xmlalibrary.interfaces.IXMLARestrictionsPart;
	
	import flash.errors.IllegalOperationError;

	public class XMLAPartFactory
	{
		//-------------------------------
		// Constructor
		//-------------------------------
		public function XMLAPartFactory()
		{
			throw new IllegalOperationError("This is a static class");
		}
		
		//-------------------------------
		// Public methods
		//-------------------------------
		static public function getPart(context:IXMLAContextPart):IXMLAPart {
			if ( context == null ) {
				return null;
			}
			var part:XMLAPart = new XMLAPart();
			part.context = context;
			
			return part;
		}
		
		static public function getPropertyPart(funcType:String):IXMLAPropertyPart {
			if ( funcType == null || funcType == "") {
				return null;
			}
			var part:IXMLAPropertyPart = new XMLAPropertyPart() as IXMLAPropertyPart;
			part.functionType = funcType;
			
			return part;
		}
		
		static public function getRestrictionPart(restrictionType:String):IXMLARestrictionsPart {
			if ( restrictionType == null || restrictionType == "" ) {
				return null;
			}
			var part:IXMLARestrictionsPart = new XMLARestrictionsPart() as IXMLARestrictionsPart;
			part.restrictionsType = restrictionType;
			
			return part;
		}
		
		static public function getDiscoverTypePart(type:String = ""):IXMLADiscoverTypePart {
			var part:IXMLADiscoverTypePart = new XMLADiscoverTypePart() as IXMLADiscoverTypePart;
			part.type = type;
			
			return part;
		}
		
		static public function getCommandPart():IXMLACommandPart {
			return new XMLACommandPart();
		}
	}
}