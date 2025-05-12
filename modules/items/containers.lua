local containers = {}

---@class ItemContainerProperties
---@field slots number
---@field maxWeight number
---@field whitelist? table<string, true> | string[]
---@field blacklist? table<string, true> | string[]

local function arrayToSet(tbl)
	local size = #tbl
	local set = table.create(0, size)

	for i = 1, size do
		set[tbl[i]] = true
	end

	return set
end

---Registers items with itemName as containers (i.e. backpacks, wallets).
---@param itemName string
---@param properties ItemContainerProperties
---@todo Rework containers for flexibility, improved data structure; then export this method.
local function setContainerProperties(itemName, properties)
	local blacklist, whitelist = properties.blacklist, properties.whitelist

	if blacklist then
		local tableType = table.type(blacklist)

		if tableType == 'array' then
			blacklist = arrayToSet(blacklist)
		elseif tableType ~= 'hash' then
			TypeError('blacklist', 'table', type(blacklist))
		end
	end

	if whitelist then
		local tableType = table.type(whitelist)

		if tableType == 'array' then
			whitelist = arrayToSet(whitelist)
		elseif tableType ~= 'hash' then
			TypeError('whitelist', 'table', type(whitelist))
		end
	end

	containers[itemName] = {
		size = { properties.slots, properties.maxWeight },
		blacklist = blacklist,
		whitelist = whitelist,
	}

end

-- setContainerProperties('paperbag', {
-- 	slots = 5,
-- 	maxWeight = 1000,
-- 	blacklist = { 'testburger' }
-- })

-- setContainerProperties('pizzabox', {
-- 	slots = 5,
-- 	maxWeight = 1000,
	-- whitelist = { 'pizza' }
-- })

setContainerProperties('bag', {
	slots = 30,
	maxWeight = 100000,
	-- blacklist = { 'sandwich' }
})

setContainerProperties('clothingbag', {
	slots = 20,
	maxWeight = 1000,
	whitelist = { 
		'maske',
	 	'pantolon',
	 	'ayakkabi',
	 	'kolye',
	 	'ustgiyim',
	 	'sapka',
	 	'gozluk',
	 	'kupe',
	 	'saat',
	 	'canta',
	 	'zirh',
	}
})

setContainerProperties('bs_bag', {
	slots = 20,
	maxWeight = 30000,
	whitelist = { 
		'tosti',
        'twerks_candy',
        'snikkel_candy',
        'sandwich',
        'donut',
        'donut2',
        'balikizgara',
        'midye',
        'ekler',
        'kovamisir',
        'patateskova',
        'pizza',
        'meyvetabagi',
        'cereztabagi',
        'citirtavuk',
        'chowmein',
        'cinboregi',
        'cinmantisi',
        'hotpot',
        'kizarmispilav',
        'kungpao',
        'noodle',
        'pekinordegi',
        'cheesecake',
        'pankek',
        'waffle',
        'cheesesteak',
        'cizburger',
        'hamburger',
        'icecream',
        'mexicanwrap',
        'patatestabagi',
        'tost',
        'yumurtaliekmek',
        'alabalikyemek',
        'istakozyemek',
        'levrekyemek',
        'salata',
        'atistirmatabagi',
        'sushi',
        'tacos',
        'burrito',
        'temales',
        'th_beef_burrito',
        'th_beef_enchilada',
        'th_beef_taco',
        'th_chicken_burrito',
        'th_chicken_caaesar_wrap',
        'th_chicken_taco',
        'th_greek_veggie_wrap',
        'th_chicken_caesar_wrap',
        'th_nachos',
        'th_quesadilla',
        'ip_bacon_cheeseburger',
        'ip_bacon_cheesefries',
        'ip_bacon_chickenburger',
        'ip_baconranch_chilicheese_fries',
        'ip_beefdip',
        'ip_canadian_poutine',
        'ip_cheeseburger',
        'ip_chickenburger',
        'ip_chickenstrips',
        'ip_curlyfries',
        'ip_fries',
        'ip_fullyloaded_nachos',
        'ip_honeylemon_chickenwings',
        'ip_nachos',
        'ip_onionrings',
        'ip_spicybuffalo_chickenwings',
        'ip_spicysriracha_chickenwings',
        'ip_steakburger',
        'ip_steaksandwich',
        'bs_bleeder',
        'bs_chickenwrap',
        'bs_creampie',
        'bs_fries',
        'bs_heartstopper',
        'bs_meatfree',
        'bs_moneyshot',
        'bs_nuggets',
        'bs_onionrings',
        'bs_rimjob',
        'bs_torpedo',
        'bs_chocolateshake',
        'bs_cookiesncreamshake',
        'bs_strawberryshake',
        'bs_vanillashake',
		'water_bottle',
        'coffee',
        'kurkakola',
        'limonata',
        'americano',
        'cappuccino',
        'coldbrew',
        'coollime',
        'filtrekahve',
        'flatwhite',
        'iceamericano',
        'icelotuslatte',
        'icemocha',
        'icewhitemocha',
        'latte',
        'mocha',
        'summerberry',
        'twinkle',
        'meyvekokteyli',
        'sutlufiltrekahve',
        'whitechocolatemocha',
        'portakalsuyupond',
        'redbull',
        'soda',
        'bs_icetea',
        'bs_sprunk',
        'bs_milkshake',
        'bs_atom',
        'th_ecola',
        'th_sprunk',
        'th_orangotang',
        'ip_coffee',
        'bs_coffee',
        'bs_ecola',
        'bs_ecola1',
        'bs_sprunk',
        'bs_orangotang',
        'bs_chocolateshake',
        'bs_cookiesncreamshake',
        'bs_strawberryshake',
        'bs_vanillashake',
		'beer',
        'whiskey',
        'vodka',
        'tequila',
        'kokteyl',
        'likor',
        'sampanya',
        'sisesarap',
        'sake',
        'raki',
        'ip_ambeer',
        'ip_blarneys',
        'ip_dusche',
        'ip_irishcider',
        'ip_logger',
        'ip_macbeth_scotch_whiskey',
        'ip_tavish_irish_whiskey',
        'ip_patriotbeer',
        'ip_pisswaser',
        'ip_pisswaser1',
        'ip_pisswaser2',
        'ip_wineglass',
	}
})

return containers
