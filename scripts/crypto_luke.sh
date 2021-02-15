#!/bin/sh

# Luke Smith's crypto script https://github.com/LukeSmithxyz/voidrice/blob/1ca7338596d10c8ff44b117e91e842dd6275a0ff/.local/bin/statusbar/crypto
# Shows the price for desired cryptocurrencies. Module updates automatically
# every calendar day, but can also be updated with a middle click.

# Currencies should be ;-separated:
# human-readable name;urlname;icon
coins="Bitcoin;btc;💰
Etherium;eth;🕊️
Monero;xmr;🇲
Stellar;xlm;🇸"

# Directory where currency info is stored.
dir="${XDG_DATA_HOME:-$HOME/.local/share}/crypto-prices"

getprices() { # The command to get the desired prices
	printf "🔄 "; printprices
	{ rm -rf "${dir:?}/*"
	echo "$coins" | while IFS=';' read -r human web icon; do
		val="$(curl -s "cad.rate.sx/1$web")" &&
		if [ "$human" == "Stellar" ]; then
			# Stellar needs to give more decimal places
			printf "%s;%0.3f;%s\n" $icon $val $human > "$dir/$web"
		else
			printf "%s;%0.1f;%s\n" $icon $val $human > "$dir/$web"
		fi
		#echo "$icon;${val%.*};$human" > "$dir/$web"
	done; [ -d "$dir" ] && touch "$dir"
	pkill -RTMIN+13 "${STATUSBAR:-dwmblocks}" ;} &
	exit
	}

printprices() { # Print/format all prices
	for x in "$dir"/*; do
		[ -f "$x" ] || break
		info="$(cut -d';' -f-2 --output-delimiter=' ' "$x")"
		printf "%s " "$info"
	done | sed 's/ $/\n/'
	}

[ ! -d "$dir" ] && mkdir -p "$dir" && { getprices; exit ;}

# If currencies haven't been updated today, try to update them.
[ "$(stat -c %x "$HOME/.local/share/crypto-prices" | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] &&
	{ ping -q -c 1 example.org >/dev/null 2>&1 && getprices || exit ;}

case $BLOCK_BUTTON in
	1) uptime="$(date -d "$(stat -c %x "$dir")" '+%D at %T' | sed "s|$(date '+%D')|Today|")"
		notify-send "Exact prices in USD" "$(awk -F';' '{print $1, $3 ":\n\t$" $2}' "$dir"/*)
<b>Last updated:</b>
	$uptime" ;;
	2) getprices ;;
	3) notify-send "💸 Crypto-currency module" "\- Left click for exact prices.
- Middle click to update.
- Shows 🔃 if updating prices.
- Manually add/remove currencies to list in the script." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

getprices
