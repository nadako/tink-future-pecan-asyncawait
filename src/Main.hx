import tink.core.Future;
import CoFuture;

// some future-returning method
function loadData(arg:String):Future<String> {
	return new Future(trigger ->
		haxe.Timer.delay(() ->
			trigger("loaded: " + arg.toUpperCase()
		), 500).stop
	);
}

function main() {
	// create future from expression
	var f = async({
		// await first future
		var dataA = await(loadData("hi"));
		// await second future
		var dataB = await(loadData("bye"));
		// return async result
		return dataA + " " + dataB;
	});

	// handle future created from expression
	f.handle(s -> trace(s));
}
