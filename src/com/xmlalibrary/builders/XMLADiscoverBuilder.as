package com.xmlalibrary.builders
{
	import com.xmlalibrary.interfaces.IXMLADiscoverBuilder;
	import com.xmlalibrary.interfaces.IXMLADiscoverTypePart;
	import com.xmlalibrary.interfaces.IXMLAPropertyPart;
	import com.xmlalibrary.interfaces.IXMLARestrictionsPart;
	
	import flash.utils.Dictionary;

	public class XMLADiscoverBuilder implements IXMLADiscoverBuilder
	{
		//------------------------------------
		// Variables
		//------------------------------------
		private var _discoverTypePart:IXMLADiscoverTypePart;
		private var _restrictionPart:IXMLARestrictionsPart;
		private var _propertyPart:IXMLAPropertyPart;
		
		//------------------------------------
		// Constructor
		//------------------------------------
		/**
		 * Constructor
		 */
		public function XMLADiscoverBuilder()
		{
		}
		
		//------------------------------------
		// Getters and Setters
		//------------------------------------
		/**
		 * @inheritDoc
		 */
		public function get type():String {
			return (this._discoverTypePart!=null)?this._discoverTypePart.type:null;
		}
		public function set type(value:String):void {
			if ( this._discoverTypePart ) {
				this._discoverTypePart.type = value;
			}
		}
		
		//------------------------------------
		// Public methods
		//------------------------------------
		/**
		 * @inheritDoc
		 */
		public function setDiscoverTypePart(part:IXMLADiscoverTypePart):void {
			this._discoverTypePart = part;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setRestrictionPart(part:IXMLARestrictionsPart):void {
			this._restrictionPart = part;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setPropertiesPart(part:IXMLAPropertyPart):void {
			this._propertyPart = part;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addRestriction(name:String, value:String):void {
			if ( this._restrictionPart != null ) {
				this._restrictionPart.add(name, value);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addProperty(name:String, value:String):void {
			if ( this._propertyPart != null ) {
				this._propertyPart.add(name, value);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():XML {
			var discover:XML=<Discover xmlns="urn:schemas-microsoft-com:xml-analysis" ></Discover>;
			
			if ( this._discoverTypePart != null ) {
				discover.appendChild(this._discoverTypePart.generate());
			}
			
			if ( this._restrictionPart != null ) {
				discover.appendChild(this._restrictionPart.generate());
			}
			
			if ( this._propertyPart != null ) {
				discover.appendChild(this._propertyPart.generate());
			}
			
			return discover;
		}
	}
}