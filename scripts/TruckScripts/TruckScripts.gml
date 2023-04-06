/// @function               GrabFlour(amount);
/// @param {real}  amount   The amount to grab
/// @return					The amount that was grabbed.
/// @description            Grabs flour from the truck, then returns the amount grabbed.
function GrabFlour(amount = 5) {
	if (invFlour >= amount) {
		invFlour -= amount;
		DisplayError(string(invFlour) + " flour left.");
		return amount;
	} else {
		var flourLeft = invFlour;
		invFlour = 0;
		return flourLeft;
	}
}