package com.xmlalibrary.context.properties
{
	import com.xmlalibrary.context.BasePropertyContext;
	
	/**
	 * Define the properties that can be accept the Property part of Discover XMLA function.
	 */
	public class DiscoverPropertyContext extends BasePropertyContext
	{
		//-------------------------------------------
		// Constant
		//-------------------------------------------
		/**
		 * @TODO documentar
		 */
		static public const FORMAT:String="Format";
		/**
		 * @TODO documentar
		 */
		static public const DATA_SOURCE_INFO:String="DataSourceInfo";
		/**
		 * @TODO documentar
		 */
		static public const SHOW_HIDDEN_CUBES:String = "ShowHiddenCubes";
		
		//-------------------------------------------
		// Constructor
		//-------------------------------------------
		/**
		 * Constructor
		 */
		public function DiscoverPropertyContext()
		{
			super();
		}
		
		//-------------------------------------------
		// Public methods
		//-------------------------------------------
		/**
		 * @inheritDoc
		 */
		override public function acceptProperties():Array {
			return [FORMAT, DATA_SOURCE_INFO, SHOW_HIDDEN_CUBES];
		}
	}
}