import haxe.macro.Expr;

// TODO: figure out how to properly integrate coroutine suspension with future suspension, i think right now it's not 100% correct
function async(expr:Expr):Expr {
	return macro new tink.core.Future(trigger -> {
		var instance = pecan.Co.co($expr).runSuspended();
		instance.onHalt = () -> trigger(CoFuture.unNull(instance.returned));
		instance.wakeup();
		return instance.terminate;
	});
}
