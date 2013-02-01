package com.xmlalibrary.constants {
	
	
	/**
	 *
	 * Types of discoveries allow to use.
	 *
	 */
	public class XMLARequesType {
		//--------------------------
		//
		// Constants
		//
		//--------------------------
		// THERE ARE OTHERS TYPES. SEE http://msdn.microsoft.com/en-us/library/ms126079(SQL.90).aspx
		/**
		 * Cube discovery.
		 */
		static public const CUBES:String="MDSCHEMA_CUBES";
		/**
		 * Dimension discovery.
		 */
		static public const DIMENSION:String="MDSCHEMA_DIMENSIONS";
		/**
		 * Hirarchy discovery.
		 */
		static public const HIERARCHIES:String="MDSCHEMA_HIERARCHIES";
		/**
		 * Level discovery.
		 */
		static public const LEVELS:String="MDSCHEMA_LEVELS";
		/**
		 * Members discovery.
		 */
		static public const MEMBERS:String="MDSCHEMA_MEMBERS";
		/**
		 * Measures discovery.
		 */
		static public const MEASURES:String="MDSCHEMA_MEASURES";
		/**
		 * Properties
	 	 */
		static public const PROPERTIES:String = "DISCOVER_PROPERTIES";

		//--------------------------
		//
		// Constructor
		//
		//--------------------------
		final public function XMLARequesType() {
		}
	}
}