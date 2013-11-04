package org.mousebomb.jsonactor.gateway
{
	/**
	 * @author Mousebomb
	 */
	public class GatewayConf
	{
		public static var GATEWAY : String = "http://127.0.0.1:81/";
		/** 服务接口路径
		 */
		public static var SERVICE_PATH : String = GATEWAY + "s/";

		/**
		 * 从一个ip初始化配置
		 */
		public static function initGatewayHost(host : String) : void
		{
			GATEWAY = host;
			SERVICE_PATH = host + "s/" ;
		}

		/**
		 * 会话id
		 */
		public static var sessionId : String;
	}
}
