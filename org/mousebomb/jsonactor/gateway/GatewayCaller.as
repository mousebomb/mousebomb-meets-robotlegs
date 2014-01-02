package org.mousebomb.jsonactor.gateway
{
	import org.mousebomb.utils.LogWriter;
	import org.robotlegs.mvcs.Actor;

	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;

	/**
	 * @author Mousebomb
	 */
	public class GatewayCaller extends Actor
	{
		/**
		 * 调用请求
		 * @param api 调用地址
		 * @param args 参数
		 * @param succ 成功返回 接受参数是JSON对象的结果对象
		 * @param err 返回一个错误信息 接受参数JSON的ErrorVO对象,若留空则自动派发事件GATEWAY_CALL_ERR
		 */
		protected function call(api : String, args : Object, succ : Function, err : Function = null) : void
		{
			var urlR : URLRequest = new URLRequest(GatewayConf.SERVICE_PATH + api + ".php");
			var urlV : URLVariables = new URLVariables();
			var loader : URLLoader = new URLLoader();
			if (GatewayConf.sessionId)
			{
				urlV.sessionId = GatewayConf.sessionId;
			}
			for (var key : String in args)
			{
				urlV[key] = args[key];
			}
			urlR.data = urlV;
			urlR.method = URLRequestMethod.POST;
			loader.addEventListener(Event.COMPLETE, serverResponse(loader, succ, err));
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErr);
			loader.load(urlR);
			LogWriter.log("调用", api);
		}

		private function ioErr(event : IOErrorEvent) : void
		{
			dispatch(new GatewayConnErrEvent(GatewayConnErrEvent.GATEWAY_CONN_ERR, event.text));
		}

		/**
		 * 上传提交
		 */
		public function uploadFile(api : String, file : FileReference, args : Object, succ : Function, err : Function = null) : void
		{
			var urlR : URLRequest = new URLRequest(GatewayConf.SERVICE_PATH + api + ".php");
			urlR.method = URLRequestMethod.POST;
			var urlV : URLVariables = new URLVariables();
			if (GatewayConf.sessionId)
			{
				urlV.sessionId = GatewayConf.sessionId;
			}
			for (var key : String in args)
			{
				urlV[key] = args[key];
			}
			urlR.data = urlV;
			urlR.method = URLRequestMethod.POST;
			file.upload(urlR);
			file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, function(e : DataEvent) : void
			{
				serverResponse(e, succ, err)(e);
			});
			file.addEventListener(IOErrorEvent.IO_ERROR, ioErr);
		}

		/**
		 * @param dataProvider 返回的数据提供者,Loader 或 DataEvent
		 */
		private function serverResponse(dataProvider : *, succ : Function, err : Function) : Function
		{
			return function(e : Event) : void
			{
				var resp : Object;
				try
				{
					LogWriter.log("返回:", dataProvider.data);
					resp = JSON.parse(dataProvider.data);
				}
				catch(e : *)
				{
					trace("不是json");
					// 返回格式错误,不是JSON 通信层错误
					dispatch(new GatewayConnErrEvent(GatewayConnErrEvent.GATEWAY_CONN_ERR, "返回不是JSON" + dataProvider.data));
				}
				if (typeof resp == "object")
				{
					if (resp.errorCode )
					{
						trace("返回错误");
						// 返回的是错误
						if (err != null)
							err(resp);
						else
						{
							// 默认处理
							dispatch(new CallErrEvent(CallErrEvent.GATEWAY_CALL_ERR, resp.errCode));
						}
					}
					else
					{
						succ(resp.result);
					}
				}
				else
				{
					// 返回格式错误,服务器端没返回Object 通信层错误
					dispatch(new GatewayConnErrEvent(GatewayConnErrEvent.GATEWAY_CONN_ERR, "需要Object,但意外返回" + dataProvider.data));
				}
			}
		}
	}
}
