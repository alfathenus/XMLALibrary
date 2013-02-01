package com.xmlalibrary.parts
{
	import com.xmlalibrary.constants.XMLARequesType;
	import com.xmlalibrary.context.restrictions.CubeRestrictionContext;
	import com.xmlalibrary.context.restrictions.DimensionRestrictionContext;
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.interfaces.IXMLARestrictionsPart;
	
	public class XMLARestrictionsPart extends XMLAPart implements IXMLARestrictionsPart
	{
		//-------------------------------
		// Variables
		//-------------------------------
		private var _restrictionType:String;
		
		//-------------------------------
		// Constructor
		//-------------------------------
		/**
		 * Constructor
		 */
		public function XMLARestrictionsPart()
		{
			super();
		}
		
		//-------------------------------
		// Getters and Setters
		//-------------------------------
		/**
		 * @inheritDoc
		 */
		public function get restrictionsType():String
		{
			return this._restrictionType;
		}
		
		public function set restrictionsType(value:String):void
		{
			this._restrictionType = value;
			
			switch ( value ) {
				case XMLARequesType.CUBES:
					this.context = new CubeRestrictionContext();
					break;
				case XMLARequesType.DIMENSION:
					this.context = new DimensionRestrictionContext();
					break;
				default:
					this.context = null;
			}
		}
	}
}