bagger(Unpacked, Baglist) :-	check_order(Unpacked, Unpacked1),	pack_large_items(Unpacked1, [], Unpacked2, Baglist2),	pack_medium_items(Unpacked2, Baglist2, Unpacked3, Baglist3),	pack_small_items(Unpacked3, Baglist3, [], Baglist).check_order(U0, U1) :-	member(chips, U0),	not(member(pepsi, U0)),	append1(pepsi, U0, U1).check_order(U, U).pack_large_items(U0, B0, U, B) :-	pack_bottles(U0, B0, U1, B1),	pack_other_large_items(U1, B1, U, B).pack_bottles(U0, B0, U, B) :-	without( Item, U0, U1),	container( Item, bottle),	size(Bottle, large),	put_large_item_in_bag(Item, B0, B1),	pack_bottles(U1, B1, U, B).pack_bottles(U, B, U, B).pack_other_large_items(U0, B0, U, B) :-	without(Item, U0, U1),	size(Item, large),	put_large_item_in_bag(Item, B0, B1),	pack_other_large_items(U1, B1, U, B).pack_other_large_items(U, B, U, B).pack_medium_items(U0, B0, U, B) :-	without(Item, U0, U1),	size(Item, medium),	freezer_bag(Item),	put_medium_item_in_bag(Item, B0, B1),	pack_medium_items(U1, B1, U, B).pack_medium_items(U, B, U, B).pack_small_items(U0, B0, U, B) :-	without(Item, U0, U1),	size(Item, small),	put_small_item_in_bag(Item, B0, B1),	pack_small_items(U1, B1, U, B).pack_small_items(U, B, U, B).