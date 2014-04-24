package org.mousebomb.jsonactor.gateway
{
	import org.mousebomb.jsonactor.model.ErrorCodeModel;
	import org.mousebomb.utils.LogWriter;

	import flash.events.Event;

	/**
	 * 通用调用返回错误
	 * @author mousebomb mousebomb@gmail.com
	 * created: 2012-10-17 
	 * last modified: 2012-10-17
	 */
	public class CallErrEvent extends Event
	{
		/** 通用调用返回错误 */
		public static const GATEWAY_CALL_ERR : String = "GATEWAY_CALL_ERR";
		
		/**
		 * 错误信息
		 */
		public var msg : String;
		/**
		 * 错误代号
		 */
		public var errCode : int;

		public function CallErrEvent(type : String, errCode_ : int)
		{
			super(type);
			this.errCode = errCode_;
			msg = ErrorCodeModel.errorList[errCode_];
			LogWriter.log("Event:"+type + ", errCode="+errCode_ + ",msg=" + msg);
		}
	}
}
