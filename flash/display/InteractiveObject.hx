package flash.display;


import flash.Lib;


class InteractiveObject extends DisplayObject {
	
	
	public var doubleClickEnabled:Bool;
	public var mouseEnabled (get, set):Bool;
	public var moveForSoftKeyboard (get, set):Bool;
	public var needsSoftKeyboard (get, set):Bool;
	
	@:noCompletion private var __mouseEnabled:Bool;
	
	
	public function new (handle:Dynamic, type:String) {
		
		doubleClickEnabled = false;
		__mouseEnabled = true;
		
		super (handle, type);
		
	}
	
	
	public function requestSoftKeyboard ():Bool {
		
		return nme_display_object_request_soft_keyboard (__handle);
		
	}
	
	
	@:noCompletion override private function __asInteractiveObject ():InteractiveObject {
		
		return this;
		
	}
	
	
	
	
	// Getters & Setters
	
	
	
	
	private function get_mouseEnabled ():Bool { return __mouseEnabled; }
	private function set_mouseEnabled (value:Bool):Bool {
		
		__mouseEnabled = value;
		nme_display_object_set_mouse_enabled (__handle, value);
		return __mouseEnabled;
		
	}
	
	
	private function set_moveForSoftKeyboard (value:Bool):Bool {
		
		nme_display_object_set_moves_for_soft_keyboard (__handle, value);
		return value;
		
	}
	
	
	private function get_moveForSoftKeyboard ():Bool {
		
		return nme_display_object_get_moves_for_soft_keyboard (__handle);
		
	}
	
	
	private function set_needsSoftKeyboard (value):Bool {
		
		nme_display_object_set_needs_soft_keyboard (__handle, value);
		return value;
		
	}
	
	
	private function get_needsSoftKeyboard ():Bool {
		
		return nme_display_object_get_needs_soft_keyboard (__handle);
		
	}
	
	
	
	
	// Native Methods
	
	
	
	
	private static var nme_display_object_set_mouse_enabled = Lib.load ("nme", "nme_display_object_set_mouse_enabled", 2);
	private static var nme_display_object_set_needs_soft_keyboard = Lib.load ("nme", "nme_display_object_set_needs_soft_keyboard", 2);
	private static var nme_display_object_get_needs_soft_keyboard = Lib.load ("nme", "nme_display_object_get_needs_soft_keyboard", 1);
	private static var nme_display_object_set_moves_for_soft_keyboard = Lib.load ("nme", "nme_display_object_set_moves_for_soft_keyboard", 2);
	private static var nme_display_object_get_moves_for_soft_keyboard = Lib.load ("nme", "nme_display_object_get_moves_for_soft_keyboard", 1);
	private static var nme_display_object_request_soft_keyboard = Lib.load ("nme", "nme_display_object_request_soft_keyboard", 1);
	
	
}