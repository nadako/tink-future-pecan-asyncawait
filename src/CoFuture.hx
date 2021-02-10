import tink.core.Future;

@:pecan.accept function await<T>(future:Future<T>, ?ret:T->Void, ?co:pecan.ICo<Any, Any, Any>):T {
	future.handle(ret);
	return null;
}

macro function async<T>(expr):haxe.macro.Expr.ExprOf<Future<T>>;

// little helper to remove Null wrapping from ICo.returned
extern inline function unNull<T>(n:Null<T>):T return n;
