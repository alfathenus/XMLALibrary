package com.xmlalibrary.context.properties
{
	import com.xmlalibrary.context.BasePropertyContext;
	
	/**
	 * Define the properties that can be accept the Property part of Discover XMLA function.
	 */
	public class ExecutePropertyContext extends BasePropertyContext
	{
		//-------------------------------------------
		// Constant
		//-------------------------------------------
		/**
		 * @TODO documentar
		 */
		static public const DATA_SOURCE_INFO:String="DataSourceInfo";
		/**
		 * @TODO documentar
		 */
		static public const FORMAT:String="Format";
		/**
		 * @TODO documentar
		 */
		static public const AXIS_FORMAT:String="AxisFormat";
		/**
		 * @TODO documentar
		 */
		static public const CATALOG:String="Catalog";
		
		//-------------------------------------------
		// Constructor
		//-------------------------------------------
		/**
		 * Constructor
		 */
		public function ExecutePropertyContext()
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
			return [DATA_SOURCE_INFO, FORMAT, AXIS_FORMAT, CATALOG];
		}
	}
}